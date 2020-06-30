import UIKit
import Combine

struct EventPublisher: Publisher {
    typealias Output = Void
    typealias Failure = Never
    
    private let control: UIControl
    private let event: UIControl.Event
    
    init(control: UIControl, event: UIControl.Event) {
        self.control = control
        self.event = event
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        let subscription = EventSubscription(subscriber: subscriber, control: control, event: event)
        subscriber.receive(subscription: subscription)
    }
}

class EventSubscription<S: Subscriber>: Subscription where S.Input == Void, S.Failure == Never  {
    private var subscriber: S?
    private let control: UIControl
    private let event: UIControl.Event
    
    init(subscriber: S, control: UIControl, event: UIControl.Event) {
        self.subscriber = subscriber
        self.control = control
        self.event = event
        control.addTarget(self, action: #selector(publish), for: event)
    }
    
    func request(_ demand: Subscribers.Demand) {}
    
    func cancel() {
        subscriber = nil
        control.removeTarget(self, action: #selector(publish), for: event)
    }
    
    @objc func publish() {
        let _ = subscriber?.receive()
    }
}

extension UIControl {
    func publisher(forEvent event: UIControl.Event) -> AnyPublisher<Void, Never> {
        EventPublisher(control: self, event: event)
            .eraseToAnyPublisher()
    }
}

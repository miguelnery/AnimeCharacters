import UIKit
import Combine
@testable import AnimeCharacters

class TriggerViewMock: UIView, TriggerView {
    private let subject = PassthroughSubject<Void, Never>()
    
    func publish() { subject.send() }
    
    func publisher(forEvent event: UIControl.Event) -> AnyPublisher<Void, Never> {
        subject.eraseToAnyPublisher()
    }
}

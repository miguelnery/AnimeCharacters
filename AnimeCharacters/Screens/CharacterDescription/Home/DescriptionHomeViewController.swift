import UIKit
import Combine

protocol DescriptionHomeDelegate: class {
    func displayDescription()
}


class DescriptionHomeViewController: UIViewController {
    private let triggerView: TriggerView
    private unowned let delegate: DescriptionHomeDelegate
    private var buttonSub: AnyCancellable?
    
    init(view: TriggerView = ButtonView(),
         delegate: DescriptionHomeDelegate) {
        triggerView = view
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = triggerView
    }
    
    override func viewDidLoad() {
        buttonSub = subscribe(to: triggerView.publisher(forEvent: .touchUpInside))
    }
    
    private func subscribe(to publisher: AnyPublisher<Void, Never>) -> AnyCancellable {
        publisher
            .sink { _ in
                self.delegate.displayDescription()
        }
    }
}

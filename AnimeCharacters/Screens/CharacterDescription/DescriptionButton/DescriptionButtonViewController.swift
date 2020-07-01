import UIKit
import Combine

class DescriptionButtonViewController: UIViewController {
    private let buttonView: ButtonViewType
    private let decodableFetcher: DecodableFetcher
    private var sub: AnyCancellable?
    
    init(view: ButtonViewType = ButtonView(),
         decodableFetcher: DecodableFetcher = DefaultDecodableFetcher()) {
        buttonView = view
        self.decodableFetcher = decodableFetcher
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = buttonView
    }
    
    override func viewDidLoad() {
        sub = subscribe(to: buttonView.publisher(forEvent: .touchUpInside))
    }
    
    private func subscribe(to publisher: AnyPublisher<Void, Never>) -> AnyCancellable {
        publisher
            .setFailureType(to: FetchError.self)
            .flatMap { self.decodableFetcher.fetchDecodable(from: .getCharacter(traitCount: 3))}
            .map { (character: Character) -> String in character.description }
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion { print(error) }
            }, receiveValue: { description in
                self.present(description: description)
            })
    }
    
    private func present(description: String) {
        DispatchQueue.main.async {
            self.present(DescriptionViewController(description: description),
                    animated: true,
                    completion: nil)
        }
    }
}

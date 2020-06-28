import UIKit
import SnapKit
import Combine

class DisplayDescriptionViewController: UIViewController {
    private let displayDescriptionView = DisplayDescriptionView(frame: .zero)
    private let decodableFetcher: DecodableFetcher
    private var sub: AnyCancellable?
    
    init(decodableFetcher: DecodableFetcher = DefaultDecodableFetcher()) {
        self.decodableFetcher = decodableFetcher
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = displayDescriptionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sub = subscribe(to: decodableFetcher.fetchDecodable(from: .getCharacter(traitCount: 3)))
    }
    
    private func subscribe(to publisher: AnyPublisher<Character, FetchError>) -> AnyCancellable {
        publisher
        .map { (character: Character) -> String in character.description }
        .sink(receiveCompletion: { completion in
            if case .failure(let error) = completion { print(error) }
        }, receiveValue: { description in
            self.displayDescriptionView.characterDescription = description
        })
    }
}

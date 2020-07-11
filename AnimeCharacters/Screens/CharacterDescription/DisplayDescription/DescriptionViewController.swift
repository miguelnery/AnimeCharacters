import UIKit
import Combine

class DescriptionViewController: UIViewController {
    private let displayDescriptionView: DescriptionViewType
    private var descriptionSub: AnyCancellable?
    
    // uau
    init(view: DescriptionViewType = DescriptionView(frame: .zero),
         publisher: AnyPublisher<String, FetchError> = DefaultDecodableFetcher().fetchDecodable(from: .getCharacter(traitCount: 3))) {
        displayDescriptionView = view
        super.init(nibName: nil, bundle: nil)
        
        descriptionSub = subscribe(to: publisher)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = displayDescriptionView
    }
    
    private func subscribe(to publisher: AnyPublisher<String, FetchError>) -> AnyCancellable {
        publisher
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion { print(error) }
            }, receiveValue: { (description: String) in
                self.displayDescriptionView.setDescription(text: description)
            })
    }
}

import UIKit
import SnapKit
import Combine

class ViewController: UIViewController {
    private let label = UILabel(frame: .zero)
    private let decodableFetcher: DecodableFetcher
    private var sub: AnyCancellable?
    
    init(decodableFetcher: DecodableFetcher = DefaultDecodableFetcher()) {
        self.decodableFetcher = decodableFetcher
        
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sub = decodableFetcher.fetchDecodable(from: .getCharacter(traitCount: 3))
            .sink(receiveCompletion: {_ in}, receiveValue: { (value: Character) in
                DispatchQueue.main.async {
                    self.label.text = value.description
                }
        })
    }
}

extension ViewController: ViewCode {
    func addViews() {
        view.addSubview(label)
    }
    
    func addConstraints() {
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func additionalSetup() {
        view.backgroundColor = .white
    }
}


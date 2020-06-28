import UIKit

class DisplayDescriptionView: UIView {
    
    private let descriptionLabel = UILabel()
    
    var characterDescription: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.descriptionLabel.text = self.characterDescription
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DisplayDescriptionView: ViewCode {
    func addViews() {
        addSubview(descriptionLabel)
    }
    
    func addConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func additionalSetup() {
        backgroundColor = .white
    }
}

import UIKit

protocol DisplayDescriptionViewType: UIView {
    func setDescription(text: String)
}

class DisplayDescriptionView: UIView {
    
    private let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DisplayDescriptionView: DisplayDescriptionViewType {
    func setDescription(text: String) {
        DispatchQueue.main.async {
            self.descriptionLabel.text = text
        }
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

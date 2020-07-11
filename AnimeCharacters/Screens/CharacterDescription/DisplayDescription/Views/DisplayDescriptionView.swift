import UIKit
import SnapKit

protocol DescriptionViewType: UIView {
    func setDescription(text: String)
}

class DescriptionView: UIView {
    
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

extension DescriptionView: DescriptionViewType {
    func setDescription(text: String) {
        DispatchQueue.main.async {
            self.descriptionLabel.text = text
        }
    }
}

extension DescriptionView: ViewCode {
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

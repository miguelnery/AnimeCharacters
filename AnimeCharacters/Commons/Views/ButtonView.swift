import UIKit

class ButtonView: UIView {
    private let button = UIButton(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonView: ViewCode {
    func addViews() {
        addSubview(button)
    }
    
    func addConstraints() {
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func additionalSetup() {
        backgroundColor = .white
    }
}

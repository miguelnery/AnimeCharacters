import UIKit
import Combine

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
 
extension ButtonView: TriggerView {
    func publisher(forEvent event: UIControl.Event) -> AnyPublisher<Void, Never> {
        button.publisher(forEvent: event)
    }
}

extension ButtonView: ViewCode {
    func addViews() {
        addSubview(button)
    }
    
    func addConstraints() {
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(50)
            $0.height.equalTo(25)
        }
    }
    
    func additionalSetup() {
        backgroundColor = .white
        button.backgroundColor = .cyan
    }
}

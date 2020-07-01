import UIKit
import SnapKit
import Combine

class DescriptionViewController: UIViewController {
    private let displayDescriptionView: DescriptionViewType
    
    init(description: String, view: DescriptionViewType = DescriptionView(frame: .zero)) {
        displayDescriptionView = view
        super.init(nibName: nil, bundle: nil)
        displayDescriptionView.setDescription(text: description)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = displayDescriptionView
    }
}

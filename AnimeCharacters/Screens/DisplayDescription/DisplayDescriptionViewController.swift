import UIKit
import SnapKit
import Combine

class DisplayDescriptionViewController: UIViewController {
    private let displayDescriptionView: DisplayDescriptionViewType
    
    init(description: String, view: DisplayDescriptionViewType = DisplayDescriptionView(frame: .zero)) {
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

import UIKit

class DescriptionCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        displayDescriptionButton()
    }
    
    private func displayDescriptionButton() {
        navigationController.pushViewController(DescriptionButtonViewController(), animated: true)
    }
    
    private func displayDescription(_ description: String) {
        navigationController.present(DescriptionViewController(description: description), animated: true, completion: nil)
    }
}

import UIKit

class DescriptionCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigateToDescriptionHome()
    }
    
    private func navigateToDescriptionHome() {
        DispatchQueue.main.async {
            self.navigationController.pushViewController(DescriptionHomeViewController(delegate: self), animated: true)
        }
    }
    
    private func navigateToDisplayDescription() {
        DispatchQueue.main.async {
            self.navigationController.present(DescriptionViewController(), animated: true, completion: nil)
        }
    }
}

extension DescriptionCoordinator: DescriptionHomeDelegate {
    func displayDescription() {
        navigateToDisplayDescription()
    }
}

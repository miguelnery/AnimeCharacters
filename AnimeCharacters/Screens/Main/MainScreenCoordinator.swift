import UIKit

class AppCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private var child: Coordinator?
    
    init(navigationController: UINavigationController = UINavigationController(),
         window: UIWindow,
         windowScene: UIWindowScene) {
        self.navigationController = navigationController
        window.rootViewController = navigationController
        window.windowScene = windowScene
    }
    
    func start() {
        
    }
    
    private func displayDescriptionScreen() {
        let coordinator = 
    }
}

import UIKit

class AppCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let window: UIWindow
    private var child: Coordinator?
    
    init(navigationController: UINavigationController = UINavigationController(nibName: nil, bundle: nil),
         window: UIWindow = UIWindow(),
         windowScene: UIWindowScene) {
        self.navigationController = navigationController
        self.window = window
        window.rootViewController = navigationController
        window.windowScene = windowScene
        window.makeKeyAndVisible()
    }
    
    func start() {
        displayDescriptionScreen()
    }
    
    private func displayDescriptionScreen() {
        let coordinator = DescriptionCoordinator(navigationController: navigationController)
        child = coordinator
        coordinator.start()
        
    }
}

import UIKit


class MainNavViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    fileprivate func setupTabs() {

        let mainController = MainViewController()
        mainController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        let authController = AuthViewController()
        authController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let galleryController = GalleryViewController()
        galleryController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
        let createWarController = CreateWarViewController()
        createWarController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
        
        viewControllers = [
            mainController,
            authController,
            galleryController,
            createWarController
        ]
    }
}


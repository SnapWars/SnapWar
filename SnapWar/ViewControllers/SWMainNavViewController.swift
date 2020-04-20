import UIKit


class SWMainNavViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    fileprivate func setupTabs() {

        let mainController = SWMainViewController()
        mainController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        let authController = SWAuthViewController()
        authController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let galleryController = SWGalleryViewController()
        galleryController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
        let createWarController = SWCreateWarViewController()
        createWarController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
        
        let battleViewController = SWBattleViewController()
        battleViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 4)
        
        viewControllers = [
            authController,
            battleViewController,
            mainController,
            galleryController,
            createWarController,
        ]
    }
}


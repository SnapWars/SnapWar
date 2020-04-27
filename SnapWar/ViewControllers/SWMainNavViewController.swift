import UIKit


class SWMainNavViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    fileprivate func setup() {

        let galleryController = SWGalleryViewController()
        galleryController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        let warController = SWWarViewController()
        warController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        
        let accountController = SWAccountViewController()
        accountController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
        viewControllers = [
            galleryController,
            warController,
            accountController
        ]
    }
}


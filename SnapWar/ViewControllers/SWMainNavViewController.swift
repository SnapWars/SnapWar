import UIKit


class SWMainNavViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    fileprivate func setup() {
        let galleryController = SWGalleryViewController()
        
        let galleryTabBarItem = UITabBarItem()
        galleryTabBarItem.image = UIImage.init(named: "gallery-unfilled")
        galleryTabBarItem.selectedImage = UIImage.init(named: "gallery-filled")
        galleryController.tabBarItem = galleryTabBarItem
        
        let warController = SWWarViewController()
        
        let warTabBarItem = UITabBarItem()
        warTabBarItem.image = UIImage.init(named: "war-unfilled")
        warTabBarItem.selectedImage = UIImage.init(named: "war-filled")
        warController.tabBarItem = warTabBarItem
        
        let accountController = SWAccountViewController()
        
        let accountTabBarItem = UITabBarItem()
        accountTabBarItem.image = UIImage.init(named: "account-unfilled")
        accountTabBarItem.selectedImage = UIImage.init(named: "account-filled")
        accountController.tabBarItem = accountTabBarItem
        
        viewControllers = [
            galleryController,
            warController,
            accountController
        ]
    }
}


import UIKit


class SWMainNavViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(!SWUserEntity.instance.isLoggedIn()) {
            present(SWAuthViewController(), animated: true, completion: nil)
        }
        
    }
    
    fileprivate func setup() {
        let galleryViewController = SWGalleryViewController()
        let warViewController = SWWarViewController()
        let accountViewController = SWAccountViewController()
        
        let iconBaseNameToControllerMapping = [
            "gallery": galleryViewController,
            "war": warViewController,
            "account": accountViewController
        ]
        
        for (iconBaseName, controller) in iconBaseNameToControllerMapping {
            let item = UITabBarItem()
            item.image = UIImage.init(named: iconBaseName + "-unfilled")
            item.selectedImage = UIImage.init(named: iconBaseName + "-filled")
            controller.tabBarItem = item
        }
        
        viewControllers = [
            accountViewController,
            galleryViewController,
            warViewController,
        ]
    }
}


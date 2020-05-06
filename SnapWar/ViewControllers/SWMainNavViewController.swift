import UIKit


class SWMainNavViewController: UITabBarController {
    let swTabBar: SWTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        //setup()
        setupCustomBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(!SWUserEntity.instance.isLoggedIn()) {
            present(SWAuthViewController(), animated: true, completion: nil)
        }
        
    }
    
    fileprivate func setupCustomBar() {
        
        
    }
    
    
    fileprivate func setup() {
        setupTabs()
        setupStyles()
    }
    
    fileprivate func setupTabs() {
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
            galleryViewController,
            warViewController,
            accountViewController
        ]
    }
    
    fileprivate func setupStyles() {
        
        tabBar.isTranslucent = true
//        tabBar.barStyle = .blackOpaque
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}


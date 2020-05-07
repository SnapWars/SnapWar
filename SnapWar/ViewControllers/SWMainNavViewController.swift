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
        tabBar.isHidden = true
        setupTabs()
        setupStyles()
    }
    
    fileprivate func setupTabs() {
        let galleryViewController = SWGalleryViewController()
        let warViewController = SWWarViewController()
        let accountViewController = SWAccountViewController()
        
        let controllers = [
            galleryViewController,
            warViewController,
            accountViewController
        ]

        for i in 0..<controllers.count {
            let item = UITabBarItem()
            item.tag = i
            controllers[i].tabBarItem = item
        }
        
        viewControllers = [
            galleryViewController,
            warViewController,
            accountViewController
        ]
        
        let customTabBar = SWTabBar()
        view.addSubview(customTabBar)
        
        NSLayoutConstraint.activate([
            customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            customTabBar.topAnchor.constraint(equalTo: tabBar.topAnchor),
            customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor),
        ])        
    }
    
    @objc
    fileprivate func switchTab(sender: UIButton) {
        selectedIndex = sender.tag
    }
    
    fileprivate func setupStyles() {
        tabBar.isTranslucent = true
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}


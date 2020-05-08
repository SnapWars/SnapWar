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
        
        let galleryTab = SWTabBarItem(named: "gallery-unfilled")
        galleryTab.tag = 0
        galleryTab.addTarget(self, action: #selector(switchTab(sender:)), for: .touchUpInside)
        
        let warTab = SWTabBarItem(named: "war-unfilled")
        warTab.tag = 2
        warTab.addTarget(self, action: #selector(switchTab(sender:)), for: .touchUpInside)
        
        
        let avatar = SWAvatar()
        let accountTab = SWTabBarItem(view: avatar)
        accountTab.tag = 1
        accountTab.addTarget(self, action: #selector(switchTab(sender:)), for: .touchUpInside)
        
        viewControllers = [
            galleryViewController,
            warViewController,
            accountViewController,
        ]
        
        let tabs = [
            galleryTab,
            warTab,
            accountTab
        ]
        
        for (index, tab) in tabs.enumerated() {
            tab.tag = index
            tab.addTarget(self, action: #selector(switchTab(sender:)), for: .touchUpInside)
        }
        
        let customTabBar = SWTabBar(tabs: tabs)
        view.addSubview(customTabBar)
        
        NSLayoutConstraint.activate([
            customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            customTabBar.topAnchor.constraint(equalTo: tabBar.topAnchor),
            customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor),
        ])
    }
    
    @objc
    fileprivate func switchTab(sender: SWTabBarItem) {
        selectedIndex = sender.tag
    }
    
    fileprivate func setupStyles() {
        tabBar.isTranslucent = true
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}


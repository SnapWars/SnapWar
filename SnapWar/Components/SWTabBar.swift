import UIKit

class SWTabBar: UITabBar {
    
    required init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setup()
    }
    
    func setup() {
        backgroundColor = SWColorType.white
        
        let galleryTab = SWTabBarItem(icon: "gallery-unfilled")
        galleryTab.tag = 0
        galleryTab.addTarget(self, action: #selector(switchTab(sender:)), for: .touchUpInside)
//        galleryTab.image = UIImage.init(named: "gallery-unfilled")
//        galleryTab.selectedImage = UIImage.init(named: "gallery-filled")
        
        let warTab = SWTabBarItem(icon: "war-unfilled")
        warTab.tag = 2
        warTab.addTarget(self, action: #selector(switchTab(sender:)), for: .touchUpInside)
//        warTab.image = UIImage.init(named: "war-unfilled")
//        warTab.selectedImage = UIImage.init(named: "war-filled")
        
        let accountTab = SWCenterTabItem()
        accountTab.tag = 1
        accountTab.addTarget(self, action: #selector(switchTab(sender:)), for: .touchUpInside)
        
        
        addSubview(galleryTab)
        addSubview(warTab)
        addSubview(accountTab)
        
        accountTab.translatesAutoresizingMaskIntoConstraints = false
        
        let halfBarHeight: CGFloat = bounds.height / 2
        NSLayoutConstraint.activate([
            galleryTab.leadingAnchor.constraint(equalTo: leadingAnchor),
            galleryTab.trailingAnchor.constraint(equalTo: centerXAnchor),
            galleryTab.topAnchor.constraint(equalTo: topAnchor),
            galleryTab.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            warTab.leadingAnchor.constraint(equalTo: centerXAnchor),
            warTab.trailingAnchor.constraint(equalTo: trailingAnchor),
            warTab.topAnchor.constraint(equalTo: topAnchor),
            warTab.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            accountTab.centerXAnchor.constraint(equalTo: centerXAnchor),
            accountTab.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -halfBarHeight),
            accountTab.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1.5),
            accountTab.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.5),
        ])
    }
    
    @objc
    fileprivate func switchTab(sender: UIButton) {
        print("tag: ", sender.tag)
    }
}

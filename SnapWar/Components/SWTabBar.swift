import UIKit

class SWTabBar: SWTabBarItem {
    var tabItems = [SWTabBarItem]()
    convenience init(items: [SWTabBarItem]) {
        self.init()
        tabItems = items
        translatesAutoresizingMaskIntoConstraints = false
        
        setup()
    }
    
    override var tintColor: UIColor! {
        didSet {
            for item in tabItems {
                item.tintColor = tintColor
            }
        }
    }
    
    func setup() {
        backgroundColor = SWColorType.white
        if tabItems.count == 0 {
            return
        }
        
        for item in tabItems {
            addSubview(item)
         
            NSLayoutConstraint.activate([
                item.heightAnchor.constraint(equalTo: heightAnchor),
                item.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0 / CGFloat(tabItems.count)),
            ])
            
        }
        
    }
}

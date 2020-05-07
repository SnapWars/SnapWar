import UIKit

class SWTabBarItem: UIButton {
    private let iconImageView = UIImageView()
    
    var itemHeight: CGFloat = 0
    var lock = false
    convenience init(icon iconName: String) {
        self.init()
        setup(iconName: iconName)
    }
    
    fileprivate func setup(iconName: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let iconImage = UIImage(named: iconName) {
            iconImageView.image = iconImage
        }
        
        addSubview(iconImageView)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            iconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
        ])
    }
}

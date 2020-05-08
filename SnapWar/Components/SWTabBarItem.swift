import UIKit

class SWTabBarItem: UIButton {
    let contentSizeMultiplier: CGFloat = 0.7
    convenience init(named: String) {
        self.init()
        addIcon(named: named)
    }
    
    convenience init(view: UIView) {
        self.init()
        addView(view: view)
    }
    
    fileprivate func addIcon(named: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView()
        if let iconImage = UIImage(named: named) {
            iconImageView.image = iconImage
        }
        
        addSubview(iconImageView)
        
        iconImageView.isUserInteractionEnabled = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: contentSizeMultiplier),
            iconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: contentSizeMultiplier),
        ])
    }
    
    fileprivate func addView(view: UIView) {
        addSubview(view)
        
        translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: centerYAnchor),
            view.widthAnchor.constraint(equalTo: heightAnchor, multiplier: contentSizeMultiplier),
            view.heightAnchor.constraint(equalTo: heightAnchor, multiplier: contentSizeMultiplier),
        ])
    }
}

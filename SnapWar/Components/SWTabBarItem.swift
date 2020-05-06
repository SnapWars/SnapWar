import UIKit

class SWTabBarItem: UIButton {
    private let iconImageView = UIImageView()
    private let textLabel = UILabel()
    
    var itemHeight: CGFloat = 0
    var lock = false
    convenience init(icon: UIImage, title: String) {
        self.init()
        setup(icon: icon, title: title)
    }
    
    fileprivate func setup(icon: UIImage, title: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.image = icon
        textLabel.text = title
        textLabel.font = UIFont.systemFont(ofSize: 11)
        
        addSubview(iconImageView)
        addSubview(textLabel)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.widthAnchor.constraint(equalTo: widthAnchor),
            iconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            textLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 2),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        
    }
}

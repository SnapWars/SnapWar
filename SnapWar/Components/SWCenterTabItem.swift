import UIKit

class SWCenterTabItem: SWButton {
    let avatar = SWAvatar()
    
    required init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        addSubview(avatar)
        
        avatar.backgroundColor = SWColorType.white
        
        avatar.isUserInteractionEnabled = false

        avatar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatar.widthAnchor.constraint(equalTo: widthAnchor),
            avatar.heightAnchor.constraint(equalTo: heightAnchor),
        ])
        
    }
    
}

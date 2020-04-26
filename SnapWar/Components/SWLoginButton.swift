import UIKit

class SWLoginButton: SWButton {
    let padding = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    
    required init() {
        super.init(frame: .zero)
       
        setupStyles()
        setTitle("Login with Snapchat", for: .normal)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStyles() {
        backgroundColor = SWColorType.snapchatYellow
        setTitleColor(SWColorType.black, for: .normal)
        frame.size.height = 30
        layer.cornerRadius = 5
        contentEdgeInsets = padding

    }
    
    
}

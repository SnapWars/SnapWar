import UIKit

class SWSwitch: UISwitch {
    required init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        onTintColor = SWColorType.green
        tintColor = SWColorType.red
        backgroundColor = SWColorType.red
        layer.cornerRadius = frame.height / 2
    }
}

import UIKit

class SWButton: UIButton {
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                alpha = 1
            } else {
                alpha = 0.5
            }
        }
    }
}

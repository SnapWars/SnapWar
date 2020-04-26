import UIKit

class SWPrimaryButton: SWButton {
    required init(label: String) {
        super.init(frame: .zero)
        setup()

        setTitle(label, for: .normal)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setup() {
        backgroundColor = SWColorType.primary
        setTitleColor(SWColorType.white, for: .normal)

    }
}

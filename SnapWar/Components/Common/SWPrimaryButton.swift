import UIKit

class SWPrimaryButton: SWButton {
    required init(label: String) {
        super.init(frame: .zero)
        setupStyles()

        setTitle(label, for: .normal)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupStyles() {
        backgroundColor = SWColorType.primary
        setTitleColor(SWColorType.white, for: .normal)

    }
}

import UIKit

class SWNavButton: UIButton {
    required init(label: String) {
        super.init(frame: .zero)
        setupStyles()

        setTitle(label, for: .normal)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyles()

        setTitle("Nav Button", for: .normal)
    }

    func setupStyles() {
        backgroundColor = SWColorType.primary
        setTitleColor(SWColorType.white, for: .normal)

    }
}



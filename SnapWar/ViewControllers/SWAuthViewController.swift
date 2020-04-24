import UIKit
import SCSDKLoginKit

class SWAuthViewController: UIViewController, UITextFieldDelegate {
    let formContainer = UIStackView()
    var nameField = SWTextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        view?.backgroundColor = SWColorType.primary
        setup()
    }

    func setup() {
        view.addSubview(formContainer)

        formContainer.axis = .vertical
        formContainer.spacing = 10
        formContainer.distribution = .equalSpacing
        formContainer.alignment = .fill

        let horizontalMargin:CGFloat = 10.0
        formContainer.translatesAutoresizingMaskIntoConstraints = false
        formContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        formContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        formContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        formContainer.isLayoutMarginsRelativeArrangement = true
        formContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        formContainer.layoutMargins = UIEdgeInsets(top: 0, left: horizontalMargin, bottom: 0, right: horizontalMargin)

        let testButton = UIButton()
        testButton.backgroundColor = UIColor.red
        testButton.setTitle("test button", for: .normal)
        formContainer.addArrangedSubview(testButton)

        if let loginButton = SCSDKLoginButton() {
            loginButton.frame.size.height += 50
            formContainer.addArrangedSubview(loginButton)
        }
    }
}

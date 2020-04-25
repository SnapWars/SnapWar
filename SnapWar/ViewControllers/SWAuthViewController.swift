import UIKit
import SCSDKLoginKit

class SWAuthViewController: UIViewController, UITextFieldDelegate {
    let formContainer = UIStackView()
    let loginButton = SWLoginButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view?.backgroundColor = SWColorType.white
        setup()
    }

    func setup() {
        view.addSubview(formContainer)

        formContainer.axis = .vertical
        formContainer.spacing = 10
        formContainer.alignment = .fill

        let horizontalMargin:CGFloat = 10.0
        formContainer.translatesAutoresizingMaskIntoConstraints = false
        formContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        formContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        formContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        formContainer.isLayoutMarginsRelativeArrangement = true
        formContainer.layoutMargins = UIEdgeInsets(top: 0, left: horizontalMargin, bottom: 0, right: horizontalMargin)

        loginButton.addTarget(self, action: #selector(handleLogin(_:)), for: .touchUpInside)
        formContainer.addArrangedSubview(loginButton)

    }
    
    @objc
    func handleLogin(_ sender: Any) {
        print("LOGGING IN")
        SCSDKLoginClient.login(from: self, completion: { success, error in
            if let error = error {
                print("ERROR", error.localizedDescription)
                return
            }
            if success {
                print("SUCCESS", success)
            }
        })
    }
}

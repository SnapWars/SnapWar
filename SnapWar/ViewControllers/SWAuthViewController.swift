import UIKit

class SWAuthViewController: UIViewController, UITextFieldDelegate {
    let formContainer = UIStackView()
    var usernameField = SWTextField()
    let passwordField = SWPasswordTextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view?.backgroundColor = SWColorType.white
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
        formContainer.layoutMargins = UIEdgeInsets(top: 0, left: horizontalMargin, bottom: 0, right: horizontalMargin)
        
        usernameField.placeholder = "username"
        usernameField.delegate = self
        usernameField.tag = 0
        formContainer.addArrangedSubview(usernameField)

        passwordField.placeholder = "password"
        passwordField.delegate = self
        passwordField.tag = 1
        formContainer.addArrangedSubview(passwordField)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = SWColorType.primary
        loginButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        loginButton.isEnabled = isFormValid()
        formContainer.addArrangedSubview(loginButton)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        loginButton.isEnabled = isFormValid()
        print("is enabled", loginButton.isEnabled)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func isFormValid() -> Bool {
        
        if let isUsernameEmpty = usernameField.text?.isEmpty {
            if isUsernameEmpty {
                return false
            }
        }
        
        if let isPasswordEmpty = passwordField.text?.isEmpty {
            if isPasswordEmpty {
                return false
            }
        }
        return true
    }
    
    @objc
    func handleSubmit() {
        print("SUBMIT")
    }
    
}

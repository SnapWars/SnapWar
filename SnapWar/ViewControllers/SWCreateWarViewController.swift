import UIKit

class SWCreateWarViewController: UIViewController {
    fileprivate let formContainer = UIStackView()
    fileprivate let descriptionField = SWTextField()
    fileprivate let submitButton = SWPrimaryButton(label: "TO BATTLE")

    fileprivate var nameField = SWTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view?.backgroundColor = SWColorType.background
        setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        nameField.delegate = nil
        descriptionField.delegate = nil
    }
    
    fileprivate func setup() {
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
        
        nameField.placeholder = "name of war"
        nameField.delegate = self
        nameField.tag = 0
        formContainer.addArrangedSubview(nameField)

        descriptionField.placeholder = "y r u fighting"
        descriptionField.delegate = self
        descriptionField.tag = 1
        formContainer.addArrangedSubview(descriptionField)
        
        submitButton.backgroundColor = SWColorType.primary
        submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        setSubmitButtonState()
        formContainer.addArrangedSubview(submitButton)
    }
    
    fileprivate func isFormValid() -> Bool {
        if let isUsernameEmpty = nameField.text?.isEmpty {
            if isUsernameEmpty {
                return false
            }
        }
        
        if let isPasswordEmpty = descriptionField.text?.isEmpty {
            if isPasswordEmpty {
                return false
            }
        }
        return true
    }
    
    fileprivate func setSubmitButtonState() {
        submitButton.isEnabled = isFormValid()
    }
    
    @objc
    fileprivate func handleSubmit() {

    }
}


/**
 Extensions
 */

extension SWCreateWarViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        setSubmitButtonState()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            handleSubmit()
        }
        
        return true
    }
}

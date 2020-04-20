import UIKit

class SWAuthViewController: UIViewController {
    var usernameField = SWTextField()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view?.backgroundColor = SWColorType.white
        setup()
    }
    
    func setup() {
        let formContainer = UIStackView()
        view.addSubview(formContainer)
        
        formContainer.axis = .vertical
        formContainer.spacing = 10
        formContainer.distribution = .equalSpacing
        formContainer.alignment = .fill
        formContainer.backgroundColor = UIColor.blue
            
        let horizontalMargin:CGFloat = 10.0
        formContainer.translatesAutoresizingMaskIntoConstraints = false
        formContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        formContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        formContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        formContainer.isLayoutMarginsRelativeArrangement = true
        formContainer.layoutMargins = UIEdgeInsets(top: 0, left: horizontalMargin, bottom: 0, right: horizontalMargin)
        
        let keyboardTypes = [
            UIKeyboardType.alphabet,
            UIKeyboardType.numberPad,
            UIKeyboardType.emailAddress
        ]
        for keyboardType in keyboardTypes {
            let textField = SWTextField()
            textField.keyboardType = keyboardType
            textField.placeholder = "type here"

            formContainer.addArrangedSubview(textField)
        }
        
    }
}

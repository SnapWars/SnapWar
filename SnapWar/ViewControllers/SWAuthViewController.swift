import UIKit

class SWAuthViewController: UIViewController, UITextFieldDelegate {
    let formContainer = UIStackView()
    
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
    }
}

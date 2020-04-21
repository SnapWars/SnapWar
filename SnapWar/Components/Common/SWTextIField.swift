import UIKit

class SWTextField: UITextField {
    let padding = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
 
    required init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = SWColorType.gray
        borderStyle = .none
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

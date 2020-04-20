import UIKit

class SWPasswordTextField: SWTextField {
    let toggleButton = UIButton()
    
    required init() {
        super.init()
        
        setupSecureTextEntry()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupSecureTextEntry() {
        keyboardType = .alphabet
        isSecureTextEntry = true
        
        toggleButton.frame = CGRect(x: 0, y: 0, width: 100, height: frame.size.height)
        toggleButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        toggleButton.setTitleColor(UIColor.black, for: .normal)
        toggleButton.addTarget(self, action: #selector(toggleTextVisibility), for: .touchUpInside)
        setToggleButtonText()
        setToggleButtonVisiblity()
        
        rightView = toggleButton
        rightViewMode = .always
        
        addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    fileprivate func setToggleButtonText() {
        if isSecureTextEntry {
           toggleButton.setTitle("Show", for: .normal)
       } else {
           toggleButton.setTitle("Hide", for: .normal)
       }
    }
    
    fileprivate func setToggleButtonVisiblity() {
        if let isEmpty = text?.isEmpty {
            if isEmpty {
                toggleButton.isHidden = true
            } else {
                toggleButton.isHidden = false
            }
        } else {
            toggleButton.isHidden = true
        }
    }
    
    @objc
    fileprivate func toggleTextVisibility() {
        isSecureTextEntry = !isSecureTextEntry
        setToggleButtonText()
        
    }
    
    @objc
    func textFieldDidChange() {
        setToggleButtonVisiblity()
    }
}

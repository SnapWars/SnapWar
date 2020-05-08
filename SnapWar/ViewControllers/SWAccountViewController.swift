import UIKit
import SCSDKBitmojiKit

class SWAccountViewController: UIViewController {
    let displayName = UILabel()
    let avatar = SWAvatar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setup() {
        view?.backgroundColor = SWColorType.background
        view.addSubview(avatar)
        view.addSubview(displayName)

        displayName.text = SWUserEntity.instance.displayName
        displayName.textColor = SWColorType.black
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        displayName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            displayName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            displayName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 150),
            avatar.heightAnchor.constraint(equalToConstant: 150),
            avatar.bottomAnchor.constraint(equalTo: displayName.topAnchor, constant: -10),
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
}

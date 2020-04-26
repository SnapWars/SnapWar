import SCSDKLoginKit
import UIKit

class SWAuthViewController: UIViewController {
    fileprivate let formContainer = UIStackView()
    fileprivate let loginButton = SWLoginButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view?.backgroundColor = SWColorType.white
        setup()
    }

    fileprivate func setup() {
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

        loginButton.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        formContainer.addArrangedSubview(loginButton)

        SCSDKLoginClient.addLoginStatusObserver(SWLoginStatusObserver.instance)
    }
    
    @objc
    fileprivate func login(_ sender: Any) {
        SCSDKLoginClient.login(from: self, completion: { success, error in
            if let error = error {
                print("Login error: ", error.localizedDescription)
            } else if success {
                print("Login success")
                
                self.fetchUserInfo()
            }
        })
    }
    
    fileprivate func fetchUserInfo() {
        let graphQLQuery = "{me{displayName, bitmoji{avatar}}}"
        
        SCSDKLoginClient.fetchUserData(
                withQuery: graphQLQuery,
                variables: nil,
                success: { userInfo in
                    if let userInfo = userInfo,
                       let jsonData = try? JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted) {
                        if let data = String(data: jsonData, encoding: .ascii) {
                            print("Fetched user info: " + data)
                            // TODO: Assign data to user model
                        }
                    }
            }) { (error, isUserLoggedOut) in
                print(error?.localizedDescription ?? "")
        }
    }
}

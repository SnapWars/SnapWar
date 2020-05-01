import SCSDKLoginKit
import UIKit

class SWAuthViewController: UIViewController {
    fileprivate let loginButton = SWLoginButton()
    let userEntity = SWUserEntity.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        view?.backgroundColor = SWColorType.snapchatYellow
        modalPresentationStyle = .fullScreen
        setup()
    }

    fileprivate func setup() {
        view.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        loginButton.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)

        SCSDKLoginClient.addLoginStatusObserver(SWLoginStatusObserver.instance)
    }
    
    func close() {
        self.dismiss(animated: true, completion: nil)
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
        print("fetchUserInfo")
           let graphQLQuery = "{me{displayName, bitmoji{avatar}, externalId}}"
           
           SCSDKLoginClient.fetchUserData(
                   withQuery: graphQLQuery,
                   variables: nil,
                   success: { userInfo in
                    /**
                     Structure:
                     ["me": {
                         bitmoji =     {
                             avatar = "link";
                         };
                         displayName = "name";
                         externalId = "id";
                     }]
                     */
                    if let userInfo = userInfo,
                       let jsonData = try? JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted),
                       let dict = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
                       let data = dict["data"] as? [String: Any],
                       let me = data["me"] as? [String: Any] {
                        if let bitmoji = me["bitmoji"] as? [String: Any],
                            let avatarURL = bitmoji["avatar"] as? String {
                            self.userEntity.avatarURL = avatarURL
                        }

                        if let displayName = me["displayName"] as? String,
                           let externalId = me["externalId"] as? String {
                            self.userEntity.displayName = displayName
                            self.userEntity.externalId = externalId
                        }
                    }
                    DispatchQueue.main.async {
                        self.close()
                    }
               }) { (error, isUserLoggedOut) in
                   print(error?.localizedDescription ?? "")
        }
    }
    
    fileprivate func goToLoginConfirm(_ userEntity: Any) {
        print("goToLoginConfirm", userEntity)
    }
}

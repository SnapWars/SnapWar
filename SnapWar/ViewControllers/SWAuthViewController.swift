import SCSDKLoginKit
import UIKit

class SWAuthViewController: UIViewController {
    fileprivate let loginButton = SWLoginButton()

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
    
    func close(_ sender: Any) {
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
    
//    fileprivate func fetchUserInfo() {
//        let graphQLQuery = "{me{displayName, bitmoji{avatar}, externalId}}"
//
//        SCSDKLoginClient.fetchUserData(
//                withQuery: graphQLQuery,
//                variables: nil,
//                success: { userInfo in
//                    if let userInfo = userInfo,
//                       let jsonData = try? JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted) {
//                        if let data = String(data: jsonData, encoding: .ascii) {
//                            print("Fetched user info: " + data)
//                            // TODO: Assign data to user
//
//                        }
//                    }
//            }) { (error, isUserLoggedOut) in
//                print(error?.localizedDescription ?? "")
//        }
//    }
    fileprivate func fetchUserInfo() {
        print("fetchUserInfo")
           let graphQLQuery = "{me{displayName, bitmoji{avatar}, externalId}}"
           
           SCSDKLoginClient.fetchUserData(
                   withQuery: graphQLQuery,
                   variables: nil,
                   success: { userInfo in
                       if let userInfo = userInfo,
                        let data = try? JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted) {
 
                        let userEntity = try? JSONDecoder().decode(UserEntity.self, from: data)
                        print("??????",  userEntity)
                        
                        
                        
                        }
               }) { (error, isUserLoggedOut) in
                   print(error?.localizedDescription ?? "")
        }
    }
    
    fileprivate func goToLoginConfirm(_ userEntity: Any) {
        print("goToLoginConfirm", userEntity)
    }
}

struct UserEntity: Codable {
    let data: [String: String]
    let me: [String: String]
    let bitmoji: [String: String]
    let avatar: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case me = "me"
        case bitmoji = "bitmoji"
        case name = "displayName"
        case avatar = "avatar"
        
    }
}

import SCSDKLoginKit

class SWLoginStatusObserver: NSObject, SCSDKLoginStatusObserver {
    // Singleton instance
    static let instance = SWLoginStatusObserver()

    func scsdkLoginLinkDidStart() {
        // Invoked when user starts the login process
        print("SWLoginStatusObserver: Login process started")
    }
    
    func scsdkLoginLinkDidFail() {
        // Invoked when user's login process fails
        print("SWLoginStatusObserver: Login process failed")
    }
    
    func scsdkLoginLinkDidSucceed() {
        // Invoked when user successfully logs in
        print("SWLoginStatusObserver: Login succeeded")
    }
    
    func scsdkLoginDidUnlink() {
        // Invoked when user logs out
        print("SWLoginStatusObserver: Logout succeeded")
    }
}

import UIKit

class SWUserEntity {
    
    static let instance = SWUserEntity()
    
    var externalId: String?
    var displayName: String?
    var avatarURL: String?
    
    private var isUserLoggedIn: Bool
    
    private init() {
        self.isUserLoggedIn = false
        self.fromDefaults()
    }
    
    fileprivate func fromDefaults() {
        let defaults = UserDefaults.standard
        if let externalId = defaults.object(forKey: "externalId") as? String {
            self.externalId = externalId
        }
        if let displayName = defaults.object(forKey: "displayName") as? String {
            self.displayName = displayName
        }
        if let avatarURL = defaults.object(forKey: "avatarURL") as? String {
            self.avatarURL = avatarURL
        }
        
        if(externalId != nil && displayName != nil && avatarURL != nil) {
            self.isUserLoggedIn = true
        }
    }
    static func from(externalId: String, displayName: String, avatarURL: String) {
        SWUserEntity.instance.isUserLoggedIn = true
        
        SWUserEntity.instance.externalId = externalId
        SWUserEntity.instance.displayName = displayName
        SWUserEntity.instance.avatarURL = avatarURL
        
        let defaults = UserDefaults.standard
        defaults.set(externalId, forKey: "externalId")
        defaults.set(displayName, forKey: "displayName")
        defaults.set(avatarURL, forKey: "avatarURL")
    }
    
    func isLoggedIn() -> Bool {
        return isUserLoggedIn
    }
}


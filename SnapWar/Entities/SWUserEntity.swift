class SWUserEntity {
    
    static let instance = SWUserEntity()
    
    var externalId: String?
    var displayName: String?
    var avatarURL: String?
    
    private var isUserLoggedIn: Bool
    
    private init() {
        self.isUserLoggedIn = false
    }
    
    static func from(externalId: String, displayName: String, avatarURL: String) {
        SWUserEntity.instance.isUserLoggedIn = true
        
        SWUserEntity.instance.externalId = externalId
        SWUserEntity.instance.displayName = displayName
        SWUserEntity.instance.avatarURL = avatarURL
    }
    
    func isLoggedIn() -> Bool {
        return isUserLoggedIn
    }
}


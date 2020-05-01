class SWUserEntity {
    
    static let shared = SWUserEntity()
    
    var externalId: String = ""
    var displayName: String = ""
    var avatarURL: String = ""
    
    
    private init() {}
 }


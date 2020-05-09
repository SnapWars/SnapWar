import UIKit

class SWConfigurationManager {
    enum Environment: String {
        case Dev = "dev"
        case Production = "production"
    }
    

    lazy var environment: Environment = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            if configuration.range(of: "Production") != nil {
                return Environment.Production
            }
        }

        return Environment.Dev
    }()
    
    var baseApiUrl: String {
        switch self.environment {
            case .Dev: return "192.168.0.218:8080"
            case .Production: return "" /// TODO: FIll in URL after deploying to prod host
        }
    }
}

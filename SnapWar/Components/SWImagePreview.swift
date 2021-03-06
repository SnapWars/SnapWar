import UIKit

class SWImagePreview: UIImageView {
    fileprivate var named: String
    
    required init(named: String, frame: CGRect) {
        self.named = named
        
        guard let image = UIImage(named: named) else {
            fatalError("Image name '\(named)' not found")
        }

        super.init(image: image)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        clipsToBounds = true
        backgroundColor = SWColorType.black
        contentMode = .scaleAspectFill
    }
    
    func getImageName() -> String {
        return named
    }
}

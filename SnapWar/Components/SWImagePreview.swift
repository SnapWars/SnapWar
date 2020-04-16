import UIKit

class SWImagePreview: UIImageView {
    let named: String
    var isActive: Bool = false
    var fullscreenView: SWFullscreenImageView
    
    required init(named: String, frame: CGRect) {
        self.named = named
        
        guard let image = UIImage(named: named) else {
            fatalError("Image name '\(named)' not found")
        }
        
        fullscreenView = SWFullscreenImageView(named: named)

        super.init(image: image)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        clipsToBounds = true
        backgroundColor = SWColorType.black
        contentMode = .scaleAspectFill
        
    }
}

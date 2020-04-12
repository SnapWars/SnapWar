import UIKit

class SWFullscreenImageView: UIView {
    var image: UIImage
    
    required init(image: UIImage) {
        self.image = image
        
        super.init(frame: .zero)
        
        setupStyles()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStyles() {
        backgroundColor = ColorType.black
    }
}

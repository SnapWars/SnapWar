import UIKit

class SWImagePreview: UIView {
    var named: String
    var imageView: UIImageView
    
    required init(named: String, frame: CGRect) {
        self.named = named
        
        guard let image = UIImage(named: named) else {
            fatalError("Image name '\(named)' not found")
        }
        self.imageView = UIImageView(image: image)
        
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        clipsToBounds = true
        backgroundColor = SWColorType.black
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        
    }
}

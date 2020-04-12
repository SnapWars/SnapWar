import UIKit

class SWFullscreenImageView: UIView {
    var imageView: UIImageView
    
    required init(named: String) {
        guard let image = UIImage(named: named) else {
            fatalError("Image name '\(named)' not found")
        }
        self.imageView = UIImageView(image: image)
        
        super.init(frame: .zero)
        
        setupStyles()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStyles() {
        backgroundColor = ColorType.black
        fitToView()
    
        addSubview(imageView)
    }
    
    func fitToView() {
        let mainScreen = UIScreen.main.bounds
        frame = CGRect(x: 0, y: 0, width: mainScreen.width, height: mainScreen.height)
        
        imageView.frame = CGRect(x: 0, y: 0, width: mainScreen.width, height: mainScreen.height)
        imageView.contentMode = .scaleAspectFit
    }
    
    public func handleResize() {
        fitToView()
    }
}

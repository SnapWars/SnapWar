import UIKit

class SWAlbumPreview: UIView {
    let image: SWImagePreview
    
    required init(named: String) {
        self.image = SWImagePreview(named: named, frame: .zero)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setup()
    }
    
    fileprivate func setup() {
        addSubview(image)
        layer.cornerRadius = 20
        layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.widthAnchor.constraint(equalTo: widthAnchor),
            image.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}

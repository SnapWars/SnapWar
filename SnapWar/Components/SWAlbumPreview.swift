import UIKit

class SWAlbumPreview: UIView {
    fileprivate let named: String
    fileprivate let titleText: String
    
    required init(named: String, title: String) {
        self.named = named
        self.titleText = title
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setup()
    }
    
    fileprivate func setup() {
        guard let image = UIImage(named: named) else {
            fatalError("Image not found")
        }
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        let overlay = UIView()
        overlay.backgroundColor = SWColorType.blackOverlay
        
        let title = UILabel()
        
        title.text = titleText
        title.textColor = SWColorType.white
        title.font = UIFont.systemFont(ofSize: 28)
        
        
        addSubview(imageView)
        addSubview(overlay)
        addSubview(title)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        overlay.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),
            
            overlay.centerXAnchor.constraint(equalTo: centerXAnchor),
            overlay.centerYAnchor.constraint(equalTo: centerYAnchor),
            overlay.widthAnchor.constraint(equalTo: widthAnchor),
            overlay.heightAnchor.constraint(equalTo: heightAnchor),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
}

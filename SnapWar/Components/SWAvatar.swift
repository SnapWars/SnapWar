import UIKit
import SCSDKBitmojiKit

class SWAvatar: UIView {
    fileprivate let bitmoji = SCSDKBitmojiIconView()
    
    override func layoutSubviews() {
        setup()
    }
    
    func setup() {
        backgroundColor = SWColorType.primary
        
        let width = frame.size.width
        layer.cornerRadius = width / 2
        clipsToBounds = true
        
        addSubview(bitmoji)
        let bitmojiSize = width * 0.7
        
        bitmoji.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bitmoji.widthAnchor.constraint(equalToConstant: bitmojiSize),
            bitmoji.heightAnchor.constraint(equalToConstant: bitmojiSize),
            bitmoji.centerYAnchor.constraint(equalTo: centerYAnchor),
            bitmoji.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])   
    }
}

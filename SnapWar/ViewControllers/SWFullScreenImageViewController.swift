
import UIKit

class SWFullscreenImageViewController: UIViewController {
    fileprivate var imageView: UIImageView
    
    required init(named: String) {
        guard let image = UIImage(named: named) else {
            fatalError("Image not found")
        }

        self.imageView = UIImageView(image: image)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view?.backgroundColor = SWColorType.black
        setup()
    }
    
    fileprivate func setup() {
        view.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        imageView.contentMode = .scaleAspectFit
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc
    fileprivate func handleTap(sender: UITapGestureRecognizer) {
        if(sender.state != .ended) {
            return
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}

import UIKit

class SWSharePageViewEntryViewController: UIViewController {
    var imageView: UIImageView
    
    required init() {
        self.imageView = UIImageView(image: UIImage.init(named: ""))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view?.backgroundColor = UIColor.clear
        setup()
    }
    
    func setup() {
        view.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        imageView.contentMode = .scaleAspectFit
    }
}

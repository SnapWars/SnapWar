import UIKit

class SWSharePageViewEntryViewController: UIViewController {
    fileprivate var imageView: UIImageView?
    fileprivate var index: Int?
    
    required init(entry: SWSharePageViewEntry) {
        if let image = entry.getImage() {
            self.imageView = UIImageView(image: image)
        }

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
    
    fileprivate func setup() {
        if let imageView = imageView {
            view.addSubview(imageView)

            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            
            imageView.contentMode = .scaleAspectFit
        }
    }
    
    func setIndex(index: Int) {
        self.index = index
    }
    
    func getIndex() -> Int? {
        return self.index
    }
}

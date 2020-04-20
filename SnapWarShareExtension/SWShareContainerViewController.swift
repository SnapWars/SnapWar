import MobileCoreServices
import Social
import UIKit

class SWShareContainerViewController: UIViewController {
    fileprivate var sharedImages = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        
        if let content = extensionContext!.inputItems[0] as? NSExtensionItem {
            let contentType = kUTTypeImage as String
            
            if let attachments = content.attachments {
                for (index, attachment) in attachments.enumerated() {
                    if attachment.hasItemConformingToTypeIdentifier(contentType) {
                        attachment.loadItem(forTypeIdentifier: contentType, options: nil, completionHandler: { data, error in
                            if let data = data as? UIImage {
                                // This scenario is applicable if using applications such as
                                // Snapchat that directly provides UIImages to this extension
                                self.sharedImages.append(data)
                            } else if let data = data as? URL {
                                // If the data content is a file url for the image,
                                // load it from the image.
                                // This scenario is applicable if attempting to use Photo library
                                // to import images
                                if let imageData = try? Data(contentsOf: data) {
                                    if let image = UIImage(data: imageData) {
                                        self.sharedImages.append(image)
                                    }
                                }
                            }
                            
                            DispatchQueue.main.async {
                                if (index == attachments.count - 1) {
                                        self.loadPageViewController()
                                    }
                                }
                        })
                    }
                }
            }
        }
    }

    fileprivate func setupNavBar() {
        self.navigationItem.title = "Add to SnapWar"

        let itemCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
        self.navigationItem.setLeftBarButton(itemCancel, animated: false)

        let itemDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        self.navigationItem.setRightBarButton(itemDone, animated: false)
    }
    
    fileprivate func loadPageViewController() {
        if self.sharedImages.count == 0 {
            fatalError("No images were shared")
        }

        let pageViewController = SWSharePageViewController(images: self.sharedImages)
        
        addChild(pageViewController)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageViewController.view)
        
        NSLayoutConstraint.activate([
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }

    @objc
    fileprivate func cancelAction() {
        self.onCompletion()
    }

    @objc
    fileprivate func doneAction() {
        // TODO: Import images to SnapWars library
        self.onCompletion()
    }
    
    fileprivate func onCompletion() {
        extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }
}

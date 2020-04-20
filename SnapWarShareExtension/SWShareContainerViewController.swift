import MobileCoreServices
import Social
import UIKit

class SWShareContainerViewController: UIViewController {
    fileprivate var sharedImages = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()

        let pageViewController = SWSharePageViewController()
        
        addChild(pageViewController)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageViewController.view)
        
        NSLayoutConstraint.activate([
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
        
        if let content = extensionContext!.inputItems[0] as? NSExtensionItem {
            let contentType = kUTTypeImage as String
            
            if let attachments = content.attachments {
                for attachment in attachments {
                    if attachment.hasItemConformingToTypeIdentifier(contentType) {
                        attachment.loadItem(forTypeIdentifier: contentType, options: nil, completionHandler: { data, error in
                            if let data = data as? UIImage {
                                self.sharedImages.append(data)
                            }
                        })
                    }
                }
            }
        }
    }

    private func setupNavBar() {
        self.navigationItem.title = "Add to SnapWar"

        let itemCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
        self.navigationItem.setLeftBarButton(itemCancel, animated: false)

        let itemDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        self.navigationItem.setRightBarButton(itemDone, animated: false)
    }

    @objc
    private func cancelAction() {
        self.onCompletion()
    }

    @objc
    private func doneAction() {
        // TODO: Import images to SnapWars library
        self.onCompletion()
    }
    
    fileprivate func onCompletion() {
        extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }
}

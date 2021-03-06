import UIKit

class SWBattleViewController: UIViewController {
    fileprivate let previewContainer = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view?.backgroundColor = SWColorType.white

        let testImageNames = [
            "test-image-1",
            "test-image-3",
        ]
        addPreviewImages(testImageNames)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if(UIWindow.isLandscape) {
             previewContainer.axis = .horizontal
        } else {
            previewContainer.axis = .vertical
        }
    }

    fileprivate func addPreviewImages(_ imageNames: Array<String>) {
        view.addSubview(previewContainer)

        previewContainer.axis = .vertical
        previewContainer.alignment = .fill
        previewContainer.distribution = .fillEqually

        previewContainer.translatesAutoresizingMaskIntoConstraints = false
        previewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        previewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        previewContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        previewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        for name in imageNames {
            let preview = SWImagePreview(named: name, frame: .zero)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
            preview.addGestureRecognizer(tap)
            preview.isUserInteractionEnabled = true
            
            previewContainer.addArrangedSubview(preview)
        }
    }
    
    @objc
    fileprivate func handleTap(sender: UITapGestureRecognizer) {
        if(sender.state != .ended) {
            return
        }
        
        guard let preview = sender.view as? SWImagePreview else {
            fatalError("Sender is not of type SWImagePreview")
        }
        
        let fullscreenImageView = SWFullscreenImageViewController(named: preview.getImageName())
        self.navigationController?.pushViewController(fullscreenImageView, animated: true)
    }
}


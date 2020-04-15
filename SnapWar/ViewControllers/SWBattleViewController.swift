import UIKit

class SWBattleViewController: UIViewController {
    let fullScreenImageView = SWFullscreenImageView(named: "test-image-4")
    let previewContainer = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view?.backgroundColor = SWColorType.white
//        addTestImage()
        addPreviewImage()
    }
    
    func addTestImage() {
        view.addSubview(fullScreenImageView)
        
    }
    
    func addPreviewImage() {
        view.addSubview(previewContainer)

        previewContainer.axis = .vertical
        previewContainer.alignment = .fill
        previewContainer.distribution = .fillEqually
        
        previewContainer.translatesAutoresizingMaskIntoConstraints = false
        previewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        previewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        previewContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        previewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        let testPreviews = [
            "test-image-1",
            "test-image-3",
        ]

        for previewName in testPreviews {
            let preview = SWImagePreview(named: previewName, frame: .zero)
            previewContainer.addArrangedSubview(preview)
        }
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        fullScreenImageView.handleResize()
        
        let orientation = UIApplication.shared.statusBarOrientation
        if(orientation.isPortrait) {
            previewContainer.axis = .vertical
        } else {
            previewContainer.axis = .horizontal
        }
    }
}


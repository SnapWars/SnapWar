import UIKit

class SWBattleViewController: UIViewController {
    let fullScreenImageView = SWFullscreenImageView(named: "test-image-4")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view?.backgroundColor = UIColor.red
        //addTestImage()
        addPreviewImage()
    }
    
    func addTestImage() {
        view.addSubview(fullScreenImageView)
        
    }
    
    func addPreviewImage() {
        let previewContainer = UIStackView()
        previewContainer.axis = .vertical
        previewContainer.alignment = .fill
        previewContainer.distribution = .fillEqually
        previewContainer.backgroundColor = UIColor.blue
        
        let screenBounds = UIScreen.main.bounds
        previewContainer.frame = CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height)
        

        
        let testPreviews = [
            "test-image-1",
            "test-image-3",
        ]
        
        for previewName in testPreviews {
            let preview = SWImagePreview(named: previewName, frame: .zero)
            previewContainer.addSubview(preview)
        }
        
        view.addSubview(previewContainer)
        
        //        let screenBounds = UIScreen.main.bounds
        //        let previewHeight = screenBounds.height / 2
        
//        let preview1 = SWImagePreview(named: "test-image-1", frame: CGRect(x: 0, y: 0, width: screenBounds.width, height: previewHeight))
//
//        let preview2 = SWImagePreview(named: "test-image-3", frame: CGRect(x: 0, y: previewHeight, width: screenBounds.width, height: previewHeight))
        
//        view.addSubview(preview1)
//        view.addSubview(preview2)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        fullScreenImageView.handleResize()
    }
    
    
}


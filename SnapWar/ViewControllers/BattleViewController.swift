import UIKit

class BattleViewController: UIViewController {
    let fullScreenImageView = SWFullscreenImageView(named: "test-image-4")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view?.backgroundColor = UIColor.red
        addTestImage()
    }
    
    func addTestImage() {
        view.addSubview(fullScreenImageView)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        fullScreenImageView.handleResize()
    }
    
    
}


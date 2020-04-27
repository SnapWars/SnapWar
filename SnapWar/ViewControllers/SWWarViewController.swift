import UIKit

class SWWarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)
        
        view?.backgroundColor = UIColor.yellow
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAdd))
    }
    
    @objc
    fileprivate func onAdd() {
        let createWarController = SWCreateWarViewController()
        self.navigationController?.pushViewController(createWarController, animated: true)
    }
}

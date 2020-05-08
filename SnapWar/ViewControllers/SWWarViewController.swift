import UIKit

class SWWarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view?.backgroundColor = SWColorType.background
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAdd))
        
        navigationController?.navigationBar.topItem?.title = "War"
    }
    
    @objc
    fileprivate func onAdd() {
        let createWarController = SWCreateWarViewController()
        self.navigationController?.pushViewController(createWarController, animated: true)
    }
}

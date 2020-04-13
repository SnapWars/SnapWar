import UIKit

class SWMainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    fileprivate func setup() {
        let routeToSelector = [
            SWRouteType.auth: #selector(toAuthController),
            SWRouteType.gallery: #selector(toGalleryController),
            SWRouteType.createWar: #selector(toCreateWarController),
        ]
        
        view?.backgroundColor = SWColorType.black
        
        let column = UIStackView()
        view.addSubview(column)
        
        column.axis = .vertical
        column.distribution = .fillEqually
        column.alignment = .fill
        column.spacing = 5
        
        column.backgroundColor = SWColorType.primary
        column.translatesAutoresizingMaskIntoConstraints = false
        column.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        column.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        column.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        column.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        

        for (routeType, selector) in routeToSelector {
            let button = SWNavButton(label: routeType.rawValue)

            button.addTarget(self, action: selector, for: .touchUpInside)

            column.addArrangedSubview(button)
        }
    }
    
    @objc
    fileprivate func toAuthController() {
        self.navigationController?.pushViewController(SWAuthViewController(), animated: true)
    }
    
    @objc
    fileprivate func toGalleryController() {
        self.navigationController?.pushViewController(SWGalleryViewController(), animated: true)
    }

    @objc
    fileprivate func toCreateWarController() {
        self.navigationController?.pushViewController(SWCreateWarViewController(), animated: true)
    }
}


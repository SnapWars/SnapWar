import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    fileprivate func setup() {
        let routeToSelector = [
            RouteType.auth: #selector(toAuthController),
            RouteType.gallery: #selector(toGalleryController),
            RouteType.createWar: #selector(toCreateWarController),
        ]
        
        view?.backgroundColor = ColorType.black
        
        let column = UIStackView()
        view.addSubview(column)
        
        column.axis = .vertical
        column.distribution = .fillEqually
        column.alignment = .fill
        column.spacing = 5
        
        column.backgroundColor = ColorType.primary
        column.translatesAutoresizingMaskIntoConstraints = false
        column.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        column.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        column.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        column.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        

        for (routeType, selector) in routeToSelector {
            let button = NavButton(label: routeType.rawValue)

            button.addTarget(self, action: selector, for: .touchUpInside)

            column.addArrangedSubview(button)
        }
    }
    
    @objc
    fileprivate func toAuthController() {
        self.navigationController?.pushViewController(AuthViewController(), animated: true)
    }
    
    @objc
    fileprivate func toGalleryController() {
        self.navigationController?.pushViewController(GalleryViewController(), animated: true)
    }

    @objc
    fileprivate func toCreateWarController() {
        self.navigationController?.pushViewController(CreateWarViewController(), animated: true)
    }
}


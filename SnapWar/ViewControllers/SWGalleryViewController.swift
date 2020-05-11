import UIKit

class SWGalleryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view?.backgroundColor = SWColorType.background
        createTestAlbumPreivew()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAdd))
        
        navigationController?.navigationBar.topItem?.title = "Gallery"
    }
    
    @objc
    fileprivate func onAdd() {
        
    }
    
    fileprivate func createTestAlbumPreivew() {
        let column = UIStackView()
        column.axis = .vertical
        column.alignment = .fill
        
        
        NSLayoutConstraint.activate([
            column.topAnchor.constraint(equalTo: view.topAnchor),
            column.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            column.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            column.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        let albums = [
            "oat war": "test-image-1",
            "selfie war": "test-image-2",
            "sticker war": "test-image-3",
        ]
        
        for (key, imageName) in albums {
            let album = SWAlbumPreview(named: imageName)
            album.frame.size.height = 50
            column.addArrangedSubview(album)
            
        }
    }
}

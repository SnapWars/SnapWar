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
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.bounces = true
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.safeAreaInsets.bottom),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        
        let albums = [
            ["title": "oat war", "image": "test-image-1"],
            ["title": "selfie war", "image": "test-image-2"],
            ["title": "sticker war", "image": "test-image-3"],
        ]
        
        var contentSize = CGSize(width: scrollView.frame.size.width , height: 0);
        var previousBottomAnchor = scrollView.topAnchor
        let topMargin: CGFloat = 10
        let albumHeight: CGFloat = 250
    
        for albumInfo in albums {
            guard let imageName = albumInfo["image"] else {
                fatalError("album image name does not exist")
            }
            guard let title = albumInfo["title"] else {
                fatalError("album title does not exist")
            }
            
            let album = SWAlbumPreview(named: imageName, title: title)
            scrollView.addSubview(album)
            album.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                album.topAnchor.constraint(equalTo: previousBottomAnchor, constant: topMargin),
                album.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                album.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                album.heightAnchor.constraint(equalToConstant: albumHeight),
            ])

            previousBottomAnchor = album.bottomAnchor
            contentSize.height += albumHeight + topMargin
        }
        scrollView.contentSize = contentSize
    }
}

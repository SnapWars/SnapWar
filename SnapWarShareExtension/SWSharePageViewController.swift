import UIKit

class SWSharePageViewController: UIPageViewController {
    fileprivate var images: [UIImage]?
    
    required init(images: [UIImage]) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        self.images = images
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.dataSource = self
        self.delegate = self
        
        self.setInitialViewController(viewController: SWSharePageViewEntryViewController())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.dataSource = nil
        self.delegate = nil
    }
    
    fileprivate func setInitialViewController(viewController: UIViewController) {
        self.setViewControllers(
            [viewController],
            direction: .forward,
            animated: false,
            completion: nil
        )
    }
}

//   _____      _                 _
//  | ____|_  _| |_ ___ _ __  ___(_) ___  _ __  ___
//  |  _| \ \/ / __/ _ \ '_ \/ __| |/ _ \| '_ \/ __|
//  | |___ >  <| ||  __/ | | \__ \ | (_) | | | \__ \
//  |_____/_/\_\\__\___|_| |_|___/_|\___/|_| |_|___/

// MARK: UIPageViewControllerDataSource, UIPageViewControllerDelegate
extension SWSharePageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return SWSharePageViewEntryViewController()
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return SWSharePageViewEntryViewController()
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        // TODO: Set this value based on # of images shared
        return 1
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

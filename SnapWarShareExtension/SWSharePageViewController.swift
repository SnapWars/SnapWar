import UIKit

class SWSharePageViewController: UIPageViewController {
    fileprivate var images: [UIImage]?
    fileprivate var pageViewManager: SWSharePageViewManager?
    
    required init(images: [UIImage]) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        self.images = images
        self.view.backgroundColor = UIColor.black
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
        
        if let images = self.images {
            if images.count == 0 {
                fatalError("No images for page view controller")
            }

            var entries = [SWSharePageViewEntry]()
            
            for image in images {
                entries.append(SWSharePageViewEntry(image: image))
            }
            
            pageViewManager = SWSharePageViewManager(entries: entries)
        }
        
        self.showInitialViewController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.dataSource = nil
        self.delegate = nil
    }
    
    fileprivate func showInitialViewController() {
        if let initialViewController = getInitialViewController() {
            self.setInitialViewController(viewController: initialViewController)
        }
    }
    
    fileprivate func getInitialViewController() -> SWSharePageViewEntryViewController? {
        if let pageViewManager = self.pageViewManager,
           let initialEntry = pageViewManager.getInitialEntry(),
           let initialEntryPageViewController = getPageViewEntryViewController(entry: initialEntry) {
            initialEntryPageViewController.setIndex(index: 0)
            return initialEntryPageViewController
        }
        
        return nil
    }
    
    fileprivate func getPreviousPageViewEntryViewController(index: Int) -> SWSharePageViewEntryViewController? {
        if let pageViewManager = self.pageViewManager,
           let previousEntry = pageViewManager.getPreviousEntry(index: index),
           let previousPageViewEntryViewController = self.getPageViewEntryViewController(entry: previousEntry) {
            previousPageViewEntryViewController.setIndex(index: index - 1)
            return previousPageViewEntryViewController
        }
        
        return nil
    }

    fileprivate func getNextPageViewEntryViewController(index: Int) -> SWSharePageViewEntryViewController? {
        if let pageViewManager = self.pageViewManager,
           let nextEntry = pageViewManager.getNextEntry(index: index),
           let nextPageViewEntryViewController = self.getPageViewEntryViewController(entry: nextEntry) {
            nextPageViewEntryViewController.setIndex(index: index + 1)
            return nextPageViewEntryViewController
        }

        return nil
    }
    
    fileprivate func getPageViewEntryViewController(entry: SWSharePageViewEntry?) -> SWSharePageViewEntryViewController? {
        if let entry = entry {
            return SWSharePageViewEntryViewController(entry: entry)
        }
        
        return nil
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
        if let pageViewEntryViewController = viewController as? SWSharePageViewEntryViewController,
           let index = pageViewEntryViewController.getIndex() {
            return self.getPreviousPageViewEntryViewController(index: index)
        }

        return nil
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let pageViewEntryViewController = viewController as? SWSharePageViewEntryViewController,
           let index = pageViewEntryViewController.getIndex() {
            return self.getNextPageViewEntryViewController(index: index)
        }

        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        guard let pageViewManager = pageViewManager else {
            return 0
        }

        return pageViewManager.getEntryCount()
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

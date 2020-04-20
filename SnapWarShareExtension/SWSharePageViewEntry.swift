import UIKit

class SWSharePageViewEntry {
    fileprivate var image: UIImage?
    
    required init(image: UIImage) {
        self.image = image
    }
    
    func getImage() -> UIImage? {
        return self.image
    }
}

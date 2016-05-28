
import UIKit

protocol DetailViewControllerDelegate: class {
    func markAsRead(lecture: Int)
    func dismissLecture(controller : UIViewController)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    
    weak var delegate:DetailViewControllerDelegate?
    
    let texts = [0: "Lord of the rings", 1: "Sherlock Holmes", 2: "A song of ice and fire", 3: "Another lecture"]
    var lectureNumber = 0
    
    @IBAction func markLectureAsRead(sender: AnyObject) {
        self.delegate?.markAsRead(lectureNumber)
    }
    
    
    @IBAction func dismissModal(sender: AnyObject) {
        self.delegate?.dismissLecture(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = texts[lectureNumber]
    }
}

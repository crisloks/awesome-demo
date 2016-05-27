
import UIKit

protocol DetailViewControllerDelegate: class {
    func markAsRead(lecture: Int)
    func dismissLecture(controller : UIViewController)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    
    weak var delegate:DetailViewControllerDelegate?
    
    let texts = [0: "Primera lectura", 1: "Segunda", 2: "Tercera", 3: "Cuarta"]
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

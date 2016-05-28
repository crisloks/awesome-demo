
import UIKit

class FirstNotificationObserverViewController: UIViewController {

    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FirstNotificationObserverViewController.reactToNotification), name: mySpecialNotificationKey, object: nil)
    }
    
    func reactToNotification() {
        self.infoLabel.text = "I heard the notification!"
    }
}

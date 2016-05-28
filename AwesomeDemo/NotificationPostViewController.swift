
import UIKit

let mySpecialNotificationKey = "com.crisloks.specialNotificationKey"

class NotificationPostViewController: UIViewController {
    
    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(NotificationPostViewController.updateNotificationSentLabel), name: mySpecialNotificationKey, object: nil)
    }
    
    @IBAction func postNotification(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(mySpecialNotificationKey, object: self, userInfo: ["info":"This is nice"])
    }
    
    func updateNotificationSentLabel() {
        self.infoLabel.text = "Notification sent!"
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

}

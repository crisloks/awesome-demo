
import UIKit

class FirstNotificationObserverViewController: UIViewController {

    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FirstNotificationObserverViewController.reactToNotification(_:)), name: mySpecialNotificationKey, object: nil)
    }
    
    func reactToNotification(notification: NSNotification) {
        if let dict = notification.object as? NSDictionary {
            if let info = dict["info"] as? String {
                self.infoLabel.text = "I heard the notification! \(info)"
            } else {
                self.infoLabel.text = "I heard the notification! But I have no info"
            }
        } else {
            self.infoLabel.text = "I heard the notification! But I have no info"
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}


import UIKit

private var accountContext = 0

class KVOViewController: UIViewController {
    
    @IBOutlet weak var currentBalanceLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    let currentBalanceKeyPath = "currentBalance"
    var account = Account()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentBalanceLabel.text = "Current balance: \(account.currentBalance)"
        
        account.addObserver(self, forKeyPath: currentBalanceKeyPath, options: .New, context: &accountContext)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func submitAction(sender: UIButton) {
        let amount = (amountTextField.text! as NSString).doubleValue
        account.update(amount)
        amountTextField.text = nil
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if context == &accountContext {
            if let newValue = change?[NSKeyValueChangeNewKey] {
                print("Current balance is now: \(newValue)")
                currentBalanceLabel.text = "Current balance: \(newValue)"
                let newValueInt = newValue.integerValue
                if newValueInt < 0 {
                    currentBalanceLabel.textColor = UIColor.redColor()
                } else {
                    currentBalanceLabel.textColor = UIColor.blackColor()
                }
            }
        }
    }
    
    deinit {
        account.removeObserver(self, forKeyPath: currentBalanceKeyPath)
    }
}

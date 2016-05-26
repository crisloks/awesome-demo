
import UIKit

private var accountContext = 0
private var personContext = 0

class KVOViewController: UIViewController {
    
    @IBOutlet weak var currentBalanceLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var personTextField: UITextField!
    
    let currentBalanceKeyPath = "currentBalance"
    let personKeyPath = "name"
    var account = Account()
    var person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentBalanceLabel.text = "Current balance: \(account.currentBalance)"
        personLabel.text = "Tu nombre es: \(person.name)"
        
        account.addObserver(self, forKeyPath: currentBalanceKeyPath, options: .New, context: &accountContext)
        person.addObserver(self, forKeyPath: personKeyPath, options: .New, context: &personContext)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func submitAction(sender: UIButton) {
        let amount = (amountTextField.text! as NSString).doubleValue
        let name = personTextField.text! as String
        account.update(amount)
        person.update(name)
        amountTextField.text = nil
        personTextField.text = nil
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
        
        if context == &personContext {
            if let newValue = change?[NSKeyValueChangeNewKey] {
                print("Person name is : \(newValue)")
                personLabel.text = "Tu nombre es: \(newValue)"
            }
        }
    }
    
    deinit {
        account.removeObserver(self, forKeyPath: currentBalanceKeyPath)
        person.removeObserver(self, forKeyPath: personKeyPath)
    }
}

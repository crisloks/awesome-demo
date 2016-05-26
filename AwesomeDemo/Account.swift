
import UIKit

class Account: NSObject {
    
    let startingBalance = 100.0
    var currentBalance = 0.0
    let currentBalanceKeyPath = "currentBalance"
    
    override init() {
        super.init()
        currentBalance = startingBalance
    }
    
    func update(amount: Double) {
        currentBalance += amount
        setValue(currentBalance, forKey: currentBalanceKeyPath)
    }

}

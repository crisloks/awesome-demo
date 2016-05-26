
import UIKit

class Account: NSObject {
    
    let startingBalance = 100.0
    dynamic var currentBalance = 0.0
    
    override init() {
        super.init()
        currentBalance = startingBalance
    }
    
    func update(amount: Double) {
        currentBalance += amount
    }

}

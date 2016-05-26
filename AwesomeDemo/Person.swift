
import UIKit

class Person: NSObject {

    dynamic var name:String = ""
    
    override init() {
        super.init()
        name = "Persona desconocida"
    }
    
    func update(newName: String) {
        if newName != "" {
            name = newName
        }
    }
    
}


import UIKit

class DelegatesViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBAction func goToDetail(sender: UIButton) {
        performSegueWithIdentifier("goToDetailSegue", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController = segue.destinationViewController as! DetailViewController
        detailViewController.delegate = self
        let button = sender as! UIButton
        detailViewController.lectureNumber = button.tag
    }
}

extension DelegatesViewController: DetailViewControllerDelegate {
    func markAsRead(lecture: Int) {
        
        switch lecture {
        case 0:
            button1.enabled = false
        case 1:
            button2.enabled = false
        case 2:
            button3.enabled = false
        case 3:
            button4.enabled = false
        default:
            break
        }
        
    }
    
    func dismissLecture(controller: UIViewController) {
        controller.dismissViewControllerAnimated(true, completion: {})
    }
}
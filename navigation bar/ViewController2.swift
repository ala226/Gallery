
import UIKit

class ViewController2: UIViewController {
   
    var Model:Model?

    @IBOutlet weak var imag: UIImageView!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var Name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        Name.text=Model?.name
        desc.text=Model?.Dsc
        imag.image=UIImage(named: (Model?.imag!)!)
    }
    

    

}

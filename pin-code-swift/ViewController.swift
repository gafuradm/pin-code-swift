import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var circle1: UIImageView!
    @IBOutlet weak var circle2: UIImageView!
    @IBOutlet weak var circle3: UIImageView!
    @IBOutlet weak var circle4: UIImageView!
    let correct = 9345
    var enteredNumbers = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func deleteTapped(_ sender: Any) {
        if enteredNumbers.count > 0 {
                enteredNumbers.removeLast()
                if enteredNumbers.isEmpty {
                    circle1.image = UIImage(systemName: "circle")
                    circle2.image = UIImage(systemName: "circle")
                    circle3.image = UIImage(systemName: "circle")
                    circle4.image = UIImage(systemName: "circle")
                } else {
                    switch enteredNumbers.count {
                    case 1:
                        circle2.image = UIImage(systemName: "circle")
                        circle3.image = UIImage(systemName: "circle")
                        circle4.image = UIImage(systemName: "circle")
                    case 2:
                        circle3.image = UIImage(systemName: "circle")
                        circle4.image = UIImage(systemName: "circle")
                    case 3:
                        circle4.image = UIImage(systemName: "circle")
                    default:
                        break
                    }
                }
            }
    }
    @IBAction func buttonTapped(_ sender: Any) {
        if let button = sender as? UIButton {
            let tag = button.tag
            if tag == delete.tag {
                if enteredNumbers.count > 0 {
                        enteredNumbers.removeLast()
                        switch enteredNumbers.count {
                        case 0:
                            circle1.image = UIImage(systemName: "circle")
                        case 1:
                            circle2.image = UIImage(systemName: "circle")
                        case 2:
                            circle3.image = UIImage(systemName: "circle")
                        case 3:
                            circle4.image = UIImage(systemName: "circle")
                        default:
                            break
                        }
                    }
            } else if tag != 10 {
                enteredNumbers += "\(tag)"
                switch enteredNumbers.count {
                case 1:
                    circle1.image = UIImage(systemName: "circle.fill")
                case 2:
                    circle2.image = UIImage(systemName: "circle.fill")
                case 3:
                    circle3.image = UIImage(systemName: "circle.fill")
                case 4:
                    circle4.image = UIImage(systemName: "circle.fill")
                default:
                    break
                }
                print("Number pressed: \(tag)")
            }
            if enteredNumbers.count == 4 {
                let res = Int(enteredNumbers)
                if res == correct {
                    print("You entered \(enteredNumbers)")
                    enteredNumbers = ""
                    let alert = UIAlertController(title: "success!", message: "success.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    circle1.image = UIImage(systemName: "circle")
                    circle2.image = UIImage(systemName: "circle")
                    circle3.image = UIImage(systemName: "circle")
                    circle4.image = UIImage(systemName: "circle")
                } else {
                    print("You entered \(enteredNumbers)")
                    enteredNumbers = ""
                    let alert = UIAlertController(title: "error!", message: "error.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    circle1.image = UIImage(systemName: "circle")
                    circle2.image = UIImage(systemName: "circle")
                    circle3.image = UIImage(systemName: "circle")
                    circle4.image = UIImage(systemName: "circle")
                }
            }
        }
    }
}

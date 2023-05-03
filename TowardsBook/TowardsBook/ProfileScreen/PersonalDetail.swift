//
//  PersonalDetail.swift
//  TowardsBook
//
//  Created by Maheen on 07/12/2022.
//

import UIKit

class PersonalDetail: UITableViewController {
    
    @IBOutlet weak var useremail: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var agetextfield: UITextField!
    @IBOutlet weak var statustextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        if let name = User.fullName {
            username.text = "\(name.capitalized)"
            username.isEnabled = false
        }
        if let email = User.email {
            useremail.text = "\(email)"
            useremail.isEnabled = false
        }
    }
    
    @IBAction func doNextStep(_ sender: UIButton) {
        if (agetextfield.text?.isEmpty)! ||
            (statustextfield.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Warning", message: "All fields are required", preferredStyle: .alert)
            let OkBtnAlert = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(OkBtnAlert)
            self.present(alertController, animated: true)
        } else {
            let request = NSMutableURLRequest(url: NSURL(string: "http://localhost/BookCollection/scripts/userstatus.php")! as URL)
            request.httpMethod = "POST"
            let postString = "a=\(agetextfield.text!)&b=\(statustextfield.text!)"
            request.httpBody = postString.data(using: String.Encoding.utf8)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                if error != nil {
                    print("error=\(String(describing: error))")
                    return
                }
                print("response = \(String(describing: response))")
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("responseString = \(String(describing: responseString))")
                
            }
            
            task.resume()
            let alert = UIAlertController(title: "", message: "Your profile has been successfully updated 🥂 !", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            let when = DispatchTime.now() + 1
            DispatchQueue.main.asyncAfter(deadline: when){
                alert.dismiss(animated: true, completion: nil)
                if let navController = self.navigationController {
                    navController.popViewController(animated: true)
                }
            }
            //agetextfield.text = ""
           // statustextfield.text = ""
        }
    }
}

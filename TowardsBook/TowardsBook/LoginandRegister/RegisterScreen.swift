//
//  RegisterScreen.swift
//  TowardsBook
//
//  Created by Maheen on 31/10/2022.
//

import UIKit

class RegisterScreen: UITableViewController {

    @IBOutlet weak var txtFullname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPassword2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        if (txtFullname.text?.isEmpty)! ||
            (txtEmail.text?.isEmpty)! ||
            (txtPhone.text?.isEmpty)! ||
            (txtPassword.text?.isEmpty)! ||
            (txtPassword2.text?.isEmpty)! {
            
            let alertController = UIAlertController(title: "Warning", message: "All fields are required", preferredStyle: .alert)
            let OkBtnAlert = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(OkBtnAlert)
            self.present(alertController, animated: true)
        }
        if ((txtPassword.text?.elementsEqual(txtPassword2.text!))! != true) {
            let alertController = UIAlertController(title: "Warning", message: "Passwords not match", preferredStyle: .alert)
            let PassBtnTapped = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(PassBtnTapped)
            self.present(alertController, animated: true)
            return
            
        }
        if let fullname = txtFullname.text, let email = txtEmail.text, let phone = txtPhone.text ,let pass = txtPassword.text ,let pass2 = txtPassword2.text {
            if pass == pass2 {
               addUser2DB(Fullname: fullname, Email: email, Phone: phone, Password: pass)
                let alertmessage = UIAlertController(title: "Thank You", message: "You have successfully registered.\nYou can login.", preferredStyle: .alert)
                let OkBtn = UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    self.dismiss(animated: true)
                })
                alertmessage.addAction(OkBtn)
                self.present(alertmessage, animated: true)
            }
        }
    }
    
    func addUser2DB(Fullname:String,Email:String,Phone:String,Password:String) {
        var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/add_user.php")!)
        request.httpMethod = "POST"
        let params = "fullname=\(Fullname)&email=\(Email)&phone=\(Phone)&pass=\(Password)"
        request.httpBody = params.data(using: .utf8)
        URLSession.shared.dataTask(with: request).resume()
    }
    
    @IBAction func GoToLoginScreen(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let PrevViewController = storyBoard.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
        PrevViewController.modalPresentationStyle = .fullScreen
        PrevViewController.modalTransitionStyle = .crossDissolve
        self.present(PrevViewController, animated: true, completion: nil)
    }
}

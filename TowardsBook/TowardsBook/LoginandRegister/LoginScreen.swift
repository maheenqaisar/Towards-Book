//
//  LoginScreen.swift
//  TowardsBook
//
//  Created by Maheen on 31/10/2022.
//

import UIKit

class LoginScreen: UITableViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Adjust iPad Height
        let tableViewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        let centeringInset = (tableViewHeight - contentHeight) / 2.0
        let topInset = max(centeringInset, 0.0)
        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    @IBAction func BackHome(_ sender: Any) {
       dismiss(animated: true)
    }
    
    @IBAction func GoToRegisterScreen(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let RegisterPage = storyBoard.instantiateViewController(withIdentifier: "RegisterScreen") as! RegisterScreen
        RegisterPage.modalPresentationStyle = .fullScreen
        RegisterPage.modalTransitionStyle = .crossDissolve
        self.present(RegisterPage, animated: true, completion: nil)
    }
    
    @IBAction func btnSignIn(_ sender: Any) {
        LoginToBookCatalogue(Email: txtEmail.text!, Password: txtPass.text!)
    }
    
    func LoginToBookCatalogue(Email:String,Password:String) {
    var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/signIn.php")!)
    request.httpMethod = "POST"
    let params = "email=\(Email)&pass=\(Password)"
    request.httpBody = params.data(using: .utf8)
    
    URLSession.shared.dataTask(with: request, completionHandler: {data,response,error in
        if data == nil && error != nil {
            print(error as Any)
        } else {
            do {
                if let json = try JSONSerialization.jsonObject(with: data!,options: []) as? [String:Any] {
                    if let userid = json["userId"] as? String {
                        User.userId = userid
                        User.fullName = json["full_name"] as? String
                        User.email = json["email"] as? String

                        DispatchQueue.main.async {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let secondVC = storyboard.instantiateViewController(identifier: "TabBarView")
                            secondVC.modalPresentationStyle = .fullScreen
                            secondVC.modalTransitionStyle = .crossDissolve
                            self.present(secondVC, animated: true, completion: nil)
                        }
                    } else {
                        DispatchQueue.main.async {
                            if (self.txtPass.text?.isEmpty)! {
                                let alertController = UIAlertController(title: "Warning", message: "All fields are required", preferredStyle: .alert)
                                let OkBtnAlert = UIAlertAction(title: "Ok", style: .default, handler: nil)
                                alertController.addAction(OkBtnAlert)
                                self.present(alertController, animated: true)
                            } else {
                                self.AlertDisplayMessage(userMessage: "Please enter correct password")
                            }
                        }
                    }
                }
            } catch {
                print(error.localizedDescription)
                self.AlertDisplayMessage(userMessage: "Could not successfully perform this request. Please try again later")
            }
        }
    }).resume()
}
    func AlertDisplayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
        }
    }
}

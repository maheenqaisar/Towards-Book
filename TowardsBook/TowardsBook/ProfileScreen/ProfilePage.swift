//
//  ProfilePage.swift
//  TowardsBook
//
//  Created by Maheen on 10/11/2022.
//

import UIKit

class ProfilePage: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var backlabel: UILabel!
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (User.userId) != nil {
            tableView.delegate = self
            tableView.dataSource = self
            
        } else {
            let loginAlert = UIAlertController(title: "Hey 😃!", message: "Kindly Login/Register First", preferredStyle: UIAlertController.Style.alert)
            loginAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
                nextViewController.modalPresentationStyle = .fullScreen
                nextViewController.modalTransitionStyle = .crossDissolve
                self.present(nextViewController, animated: true, completion: nil)
                
            }))
            loginAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (action: UIAlertAction!) in
                loginAlert.dismiss(animated: true, completion: nil)
            }))
            self.present(loginAlert, animated: true, completion: nil)
        }
    }
    
    func configure() {
        
        models.append(Section(title: "Dashboard", options: [
            .staticCell(model: SettingOption(title: "Personal Information", icon: UIImage(systemName: "person"), iconBackgroundColor: .lightGray) {
                
                let personalinfo = self.storyboard?.instantiateViewController(withIdentifier: "PersonalDetail") as! PersonalDetail
                self.navigationController?.pushViewController(personalinfo, animated: true)

                
            }),
            .staticCell(model: SettingOption(title: "Security and Privacy", icon: UIImage(systemName: "note.text.badge.plus"), iconBackgroundColor: .link) {
                
                let myalert = UIAlertController(title: "Privacy Policy", message: "TowardsBook may change the terms of this Privacy Policy at any time. Whenever TowardsBook makes a material change, TowardsBook will provide appropriate notice to you. The effective date of the most recent version of this Privacy Policy will appear at the top of this page.", preferredStyle: .alert)
               
                let cancelbutton = UIAlertAction(title: "Ok", style: .cancel) { (action) in
                }
                myalert.addAction(cancelbutton)
                self.present(myalert, animated: true, completion: nil)
                
            }),
            
            .staticCell(model: SettingOption(title: "Survey Questions", icon: UIImage(systemName: "questionmark.circle"), iconBackgroundColor: .systemMint) {
                print("Survey Questions")
                
                let surveyques = self.storyboard?.instantiateViewController(withIdentifier: "QuestionScreen") as! QuestionScreen
                self.navigationController?.pushViewController(surveyques, animated: true)
                
            })
        
        ]))
        
        models.append(Section(title: "Content", options: [
            .staticCell(model: SettingOption(title: "Favorites", icon: UIImage(systemName: "heart"), iconBackgroundColor: .systemRed) {
                
                self.tabBarController?.selectedIndex = 1
                
            }),
            
            .staticCell(model: SettingOption(title: "Log Out", icon: UIImage(systemName: "square.and.arrow.up.circle"), iconBackgroundColor: .black) {
                //print("Tapped First Cell")

                let logoutAlert = UIAlertController(title: "Oh no !", message: "Are You sure you want to logout", preferredStyle: UIAlertController.Style.alert)

                logoutAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
                nextViewController.modalPresentationStyle = .fullScreen
                nextViewController.modalTransitionStyle = .crossDissolve
                self.present(nextViewController, animated: true, completion: nil)
                }))

                logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (action: UIAlertAction!) in
                    logoutAlert.dismiss(animated: true, completion: nil)
                }))

                self.present(logoutAlert, animated: true, completion: nil)
                
            })
        
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]

        switch model.self {
            
        case .staticCell(let model):
          guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingViewCell.identifier, for: indexPath) as? SettingViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let type = models[indexPath.section].options[indexPath.row]
        
        switch type.self {
            
        case .staticCell(let model):
            model.handler()
        }
    }
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingViewCell.self, forCellReuseIdentifier: SettingViewCell.identifier)
        return table
    }()
    
}

struct Section {
    let title: String
    let options: [SettingOptionType]
}

enum SettingOptionType {
    case staticCell(model: SettingOption)
}

struct SettingOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (()-> Void)
}

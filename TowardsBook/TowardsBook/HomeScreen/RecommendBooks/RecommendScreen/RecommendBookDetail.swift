//
//  RecommendBookDetail.swift
//  TowardsBook
//
//  Created by Maheen on 25/12/2022.
//

import UIKit

class RecommendBookDetail: UIViewController {
    
    private let rateViewController = RateKitViewController()
    
    @IBOutlet weak var btnFavorite: UIBarButtonItem!
    @IBOutlet weak var BookImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var reccproducts : RecommendProduct?
    var id : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        BookView()
        //RatingStar
        rateViewController.delegate = self
        rateViewController.modalPresentationStyle = .overFullScreen
        rateViewController.confirmRateEnabled = true
        rateViewController.showHeaderImage = true
        rateViewController.headerImage = UIImage(named: "initial_smile")
        rateViewController.headerImageIsStatic = false
        rateViewController.headerImages = [
            UIImage(named: "smile_1"),
            UIImage(named: "smile_2"),
            UIImage(named: "smile_3"),
            UIImage(named: "smile_4"),
            UIImage(named: "smile_5")
        ]
        rateViewController.submitTextColor = .orange
        rateViewController.submitText = "Send Rate"
    }
    
    private func BookView(){
        priceLbl.text = (reccproducts?.price!)! + "$"
        titleLbl.text = reccproducts?.name!
        descriptionLbl.text = reccproducts?.description!
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: URL(string:(self.reccproducts?.img)!)!)
            DispatchQueue.main.async {
                self.BookImageView.image = UIImage(data: data!)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if (User.userId) != nil {
        isFav(userId: User.userId!, recommendproductId: (reccproducts?.id)!)
        } else {
            let RegisterAlert = UIAlertController(title: "Hey 😃!", message: "Kindly Login/Register First", preferredStyle: UIAlertController.Style.alert)

            RegisterAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
            nextViewController.modalPresentationStyle = .fullScreen
            nextViewController.modalTransitionStyle = .crossDissolve
            self.present(nextViewController, animated: true, completion: nil)
            }))

            RegisterAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (action: UIAlertAction!) in
                self.navigationController?.popViewController(animated: true)
            }))

            self.present(RegisterAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        if btnFavorite.image == UIImage(systemName: "bookmark") {
            addFavs(userId: User.userId!, recommendproductId: (reccproducts?.id)!)
            btnFavorite.image = UIImage(systemName: "bookmark.circle.fill")
        } else {
            delToFavs(userId: User.userId!, recommendproductId: (reccproducts?.id)!)
            btnFavorite.image = UIImage(systemName: "bookmark")
        }
    }
    
    func addFavs(userId: String, recommendproductId: String) {
        var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/addRecFav.php")!)
        request.httpMethod = "POST"
        let params = "recommendproductId=\(recommendproductId)&userId=\(userId)"
        request.httpBody = params.data(using: .utf8)
        URLSession.shared.dataTask(with: request).resume()
    }
    
    func isFav(userId: String, recommendproductId: String) {
        var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/isRecFav.php")!)
        request.httpMethod = "POST"
        let params = "recommendproductId=\(recommendproductId)&userId=\(userId)"
        request.httpBody = params.data(using: .utf8)
        URLSession.shared.dataTask(with: request,completionHandler: {data,response,error in
            if data == nil && error != nil{
                print(error?.localizedDescription as Any)
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!,options: []) as? [String:Any] {
                        if json["success"] as! Int == 1 {
                            self.btnFavorite.image = UIImage(systemName: "bookmark.circle.fill")
                        } else {
                            self.btnFavorite.image = UIImage(systemName: "bookmark")
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }).resume()
    }
    
    func delToFavs(userId: String, recommendproductId: String) {
        var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/deleteRecFavorite.php")!)
        request.httpMethod = "POST"
        let params = "recommendproductId=\(recommendproductId)&userId=\(userId)"
        request.httpBody = params.data(using: .utf8)
        URLSession.shared.dataTask(with: request).resume()
        
    }
    
    @IBAction func RateUs(_ sender: Any) {
        present(rateViewController, animated: true, completion: nil)
    }
}
extension RecommendBookDetail: RateKitViewControllerDelegate {

    func didChange(rate: Int) {
        print("Current rate is \(rate)")
    }

    func didSubmit(rate: Int) {
        print("Submit with rate \(rate)")
    }
    
    func didDismiss() {
        print("Dismiss the rate view")
    }
    
}

//
//  RecommendScreen.swift
//  TowardsBook
//
//  Created by Maheen on 03/11/2022.
//

import UIKit

class RecommendScreen: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    var ReccList = [RecommendProduct]()
    
    var id : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
        registerCells()
        get_alldata(Id: id!)
        
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: ReccTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ReccTableViewCell.identifier)
     }

    func get_alldata(Id:String) {
        var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/recommendproducts.php")!)
        request.httpMethod = "POST"
        let postData = "id=\(Id)"
        request.httpBody = postData.data(using: .utf8)
        URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
            if error != nil && data == nil{
                print(error.debugDescription)
            }else{
                self.ReccList.removeAll()
                do {
                    let json = try JSONDecoder().decode(Products.self, from: data!)
                    if let list = json.recommendproducts{
                        self.ReccList  = list
                    }
                } catch {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }).resume()
    }

}



extension RecommendScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReccList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReccTableViewCell.identifier) as! ReccTableViewCell
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: URL(string:self.ReccList[indexPath.row].img!)!)
            DispatchQueue.main.async {
                if data != nil {
                    cell.BookImageView.image = UIImage(data: data!)
                }
            }
        }
        cell.titleLbl.text = self.ReccList[indexPath.row].name
        cell.priceLbl.text = self.ReccList[indexPath.row].price!+"$"
        cell.closure = {
            let detailvc: PDFWebScreen = PDFWebScreen()
            detailvc.urlString = self.ReccList[indexPath.row].link!
            self.present(detailvc, animated: true, completion: nil)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = RecommendBookDetail.instantiate()
        controller.reccproducts = ReccList[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
        print("Well working")
    }
}

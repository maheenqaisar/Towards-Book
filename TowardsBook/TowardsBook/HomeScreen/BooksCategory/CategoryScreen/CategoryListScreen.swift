//
//  CategoryListScreen.swift
//  TowardsBook
//
//  Created by Maheen on 11/11/2022.
//

import UIKit

class CategoryListScreen: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var productList = [Product]()
    var id : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
        registerCells()
        get_alldata(Id: id!)
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: ListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ListTableViewCell.identifier)
    }

    
    func get_alldata(Id:String) {
        var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/get_products.php")!)
        request.httpMethod = "POST"
        let postData = "id=\(Id)"
        request.httpBody = postData.data(using: .utf8)
        URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
            if error != nil && data == nil{
                print(error.debugDescription)
            }else{
                self.productList.removeAll()
                do {
                    let json = try JSONDecoder().decode(Products.self, from: data!)
                    if let list = json.products{
                        self.productList  = list
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


extension CategoryListScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier) as! ListTableViewCell
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: URL(string:self.productList[indexPath.row].img!)!)
            DispatchQueue.main.async {
                if data != nil {
                    cell.BookImageView.image = UIImage(data: data!)
                }
            }
        }
        cell.titleLbl.text = self.productList[indexPath.row].name
        cell.priceLbl.text = self.productList[indexPath.row].price!+"$"
        cell.iPath = indexPath
        cell.closure = {
            let detailvc: PDFWebScreen = PDFWebScreen()
            //detailvc.modalPresentationStyle = .fullScreen
            detailvc.navigationController?.pushViewController(detailvc, animated: true)
            detailvc.modalTransitionStyle = .crossDissolve
            detailvc.urlString = self.productList[indexPath.row].link!
            self.present(detailvc, animated: true, completion: nil)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = BookDetail.instantiate()
        controller.product = productList[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
        print("Well working")
    }
}

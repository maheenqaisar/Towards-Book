//
//  PopularScreen.swift
//  TowardsBook
//
//  Created by Maheen on 11/12/2022.
//

import UIKit

class PopularScreen: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var shoppingView: UICollectionView!
    
    var productList = [PopularProduct]()
    var id : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.backgroundColor = .systemBackground
        get_alldata(Id: id!)
        searchBar.delegate = self
        registerCells()
        
    }
    
    private func registerCells() {
        shoppingView.register(UINib(nibName: ProductListViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductListViewCell.identifier)
     }
    
    func get_selected_data(q:String) {
        var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/popular_selected_products.php")!)
        
        request.httpMethod = "POST"
           
        let postData = "query=\(q)"
           
        request.httpBody = postData.data(using: .utf8)
           
        URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
            if error != nil && data == nil{
                print(error.debugDescription)
            }else{
                self.productList.removeAll()
                do {
                    let json = try JSONDecoder().decode(Products.self, from: data!)
                    if let list = json.popularproducts{
                        self.productList  = list
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
                DispatchQueue.main.async {
                    self.shoppingView.reloadData()
                }
                
            }
        }).resume()
    }
    func get_alldata(Id:String) {

        var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/popularproducts.php")!)
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
                    if let list = json.popularproducts{
                        self.productList  = list
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
                DispatchQueue.main.async {
                    self.shoppingView.reloadData()
                }
            }
        }).resume()
    }
}

extension PopularScreen: UICollectionViewDelegate, UICollectionViewDataSource {

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListViewCell.identifier, for: indexPath) as! ProductListViewCell
        
            DispatchQueue.global().async {
            let data = try? Data(contentsOf: URL(string:self.productList[indexPath.row].img!)!)
                DispatchQueue.main.async {
                    if data != nil {
                        cell.imgView.image = UIImage(data: data!)
                    }
                }
            }
        
        cell.lblTitle.text = self.productList[indexPath.row].name
        cell.lblPrice.text = self.productList[indexPath.row].price!+"$"
        cell.closure = {
            let detailvc: PDFWebScreen = PDFWebScreen()
            detailvc.urlString = self.productList[indexPath.row].link!
            self.present(detailvc, animated: true, completion: nil)
        }
        
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "PopularDetail", sender: productList[indexPath.row])
        let controller = PopularBookDetail.instantiate()
        controller.products = productList[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
        
    }
}
extension PopularScreen: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text{
            get_selected_data(q: query)
        }else{
            get_alldata(Id: id!)
        }
        
    }
}

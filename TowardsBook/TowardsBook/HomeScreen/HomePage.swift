//
//  HomePage.swift
//  TowardsBook
//
//  Created by Maheen on 10/11/2022.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    @IBOutlet weak var myLabelRecc: UILabel!
    
    var categories = [Category]()
    var populars = [Popular]()
    var reccbook = [Recommend]()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: false)
        GetReccCategories()
        GetPopularCategories()
        GetListCategories()
        registerCells()
        self.myLabelRecc.isHidden = true
    }
    
    private func registerCells() {
        
        categoryCollectionView.register(UINib(nibName: CategoryViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryViewCell.identifier)
        popularCollectionView.register(UINib(nibName: PopularViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: RecBookViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RecBookViewCell.identifier)
    }

    func GetListCategories() {
        let request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/get_categories.php")!)
        URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
            if data == nil && error != nil{
                print(error.debugDescription)
            }else{
                self.categories.removeAll()
                do {
                        let json = try JSONDecoder().decode(Categories.self, from: data!)
                        if let categories = json.categories {
                            self.categories = categories
                        }
                    DispatchQueue.main.async {
                        self.categoryCollectionView.reloadData()
                    }
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }).resume()
        
    }
    func GetPopularCategories() {
        let request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/popularcategories.php")!)
        URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
            if data == nil && error != nil{
                print(error.debugDescription)
            }else{
                self.populars.removeAll()
                do {
                        let json = try JSONDecoder().decode(Categories.self, from: data!)
                        if let popularcategories = json.popularcategories {
                            self.populars = popularcategories
                        }
                    DispatchQueue.main.async {
                        self.popularCollectionView.reloadData()
                    }
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }).resume()
        
    }
    
    func GetReccCategories() {
        let request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/recommendcategories.php")!)
        URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
            if data == nil && error != nil{
                print(error.debugDescription)
            }else{
                self.reccbook.removeAll()
                do {
                    let json = try JSONDecoder().decode(Categories.self, from: data!)
                    if let recommendcategories = json.recommendcategories {
                        self.reccbook = recommendcategories
                    }
                    DispatchQueue.main.async {
                        self.specialsCollectionView.reloadData()
                    }
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }).resume()
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        print(#line, #function)
        specialsCollectionView.delegate = self
        specialsCollectionView.dataSource = self
        self.myLabelRecc.isHidden = false
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let data = sender as? String {
            if segue.identifier == "GoCategories" {
                let dest = segue.destination as! CategoryListScreen
                dest.id = data
                if let secondViewController = segue.destination as? CategoryListScreen {
                    secondViewController.modalPresentationStyle = .fullScreen
                }
            }
            if segue.identifier == "GoPopular" {
                let dest = segue.destination as! PopularScreen
                dest.id = data
                if let secondViewController = segue.destination as? PopularScreen {
                    secondViewController.modalPresentationStyle = .fullScreen
                }
            }
            if segue.identifier == "GoRecc" {
                let dest = segue.destination as! RecommendScreen
                dest.id = data
                if let secondViewController = segue.destination as? RecommendScreen {
                    secondViewController.modalPresentationStyle = .fullScreen
                    
                }
            }
        }
    }
}

extension HomePage: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCell.identifier, for: indexPath) as! CategoryViewCell
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: URL(string:self.categories[indexPath.row].img!)!)
                DispatchQueue.main.async {
                    if data != nil {
                        cell.categoryImageView.image = UIImage(data: data!)
                    }
                }
            }
            cell.categoryTitleLbl.text = self.categories[indexPath.row].name
            return cell
            
            
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularViewCell.identifier, for: indexPath) as! PopularViewCell
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: URL(string:self.populars[indexPath.row].img!)!)
                DispatchQueue.main.async {
                    if data != nil {
                        cell.BookImageView.image = UIImage(data: data!)
                    }
                }
            }
            cell.titleLbl.text = self.populars[indexPath.row].name
            cell.descriptionLbl.text = self.populars[indexPath.row].description
            return cell
            
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecBookViewCell.identifier, for: indexPath) as! RecBookViewCell
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: URL(string:self.reccbook[indexPath.row].img!)!)
                DispatchQueue.main.async {
                    if data != nil {
                        cell.BookImageView.image = UIImage(data: data!)
                    }
                }
            }
            cell.titleLbl.text = self.reccbook[indexPath.row].name
            cell.descriptionLbl.text = self.reccbook[indexPath.row].description
            return cell
            
        default: return UICollectionViewCell()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return reccbook.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case categoryCollectionView:
            performSegue(withIdentifier: "GoCategories", sender: categories[indexPath.row].id)
        case popularCollectionView:
            performSegue(withIdentifier: "GoPopular", sender: populars[indexPath.row].id)
        case specialsCollectionView:
            performSegue(withIdentifier: "GoRecc", sender: reccbook[indexPath.row].id)
        default:
            break
        }
    }
}

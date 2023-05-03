//
//  FavouriteScreen.swift
//  TowardsBook
//
//  Created by Maheen on 10/11/2022.
//

import UIKit

class FavouriteScreen: UIViewController {
    
    @IBOutlet weak var collectionViewFavs: UICollectionView!
    @IBOutlet weak var collectionViewpopularFavs: UICollectionView!
    @IBOutlet weak var collectionViewReccFavs: UICollectionView!
    
    var favList = [Product]()
    var favListpopular = [PopularProduct]()
    var favListRecc = [RecommendProduct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        registerCells()
    }
    
    private func registerCells() {
        collectionViewFavs.register(UINib(nibName: FavoritesViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: FavoritesViewCell.identifier)
        collectionViewpopularFavs.register(UINib(nibName: PopularFavoritesViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularFavoritesViewCell.identifier)
        collectionViewReccFavs.register(UINib(nibName: ReccFavoritesViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ReccFavoritesViewCell.identifier)
     }
    
    override func viewWillAppear(_ animated: Bool) {
           //self.navigationController?.topViewController?.title = "My Favorites"
   
        if (User.userId) != nil {
            getFavorites(userId: User.userId!)
            getPopularFavorites(userId: User.userId!)
            getRecFavorites(userId: User.userId!)
            
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
                RegisterAlert.dismiss(animated: true, completion: nil)
            }))

            self.present(RegisterAlert, animated: true, completion: nil)
        }
    }
    
    func getFavorites(userId:String) {
        var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/getFavorites.php")!)
        request.httpMethod = "POST"
        let param = "userId=\(userId)"
        request.httpBody = param.data(using: .utf8)
        URLSession.shared.dataTask(with: request, completionHandler: {data,response,error in
            if data == nil && error != nil{
                print(error?.localizedDescription ?? "error")
            }else{
                self.favList.removeAll()
                do {
                    let json = try JSONDecoder().decode(Favorites.self, from: data!)
                    if let favs = json.favorites{
                        self.favList = favs
                    }
                } catch  {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self.collectionViewFavs.reloadData()
                }
            }
        }).resume()
    }
    
    func getPopularFavorites(userId:String) {
        var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/getPopularFavorites.php")!)
        request.httpMethod = "POST"
        let param = "userId=\(userId)"
        request.httpBody = param.data(using: .utf8)
        URLSession.shared.dataTask(with: request, completionHandler: {data,response,error in
            if data == nil && error != nil{
                print(error?.localizedDescription ?? "error")
            }else{
                self.favListpopular.removeAll()
                do {
                    let json = try JSONDecoder().decode(Favorites.self, from: data!)
                    if let favs = json.popularfavorites{
                        self.favListpopular = favs
                    }
                } catch  {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self.collectionViewpopularFavs.reloadData()
                }
            }
        }).resume()
    }
    
    func getRecFavorites(userId:String) {
        var request = URLRequest(url: URL(string: "http://localhost/BookCollection/scripts/getRecFavorites.php")!)
        request.httpMethod = "POST"
        let param = "userId=\(userId)"
        request.httpBody = param.data(using: .utf8)
        URLSession.shared.dataTask(with: request, completionHandler: {data,response,error in
            if data == nil && error != nil{
                print(error?.localizedDescription ?? "error")
            }else{
                self.favListpopular.removeAll()
                do {
                    let json = try JSONDecoder().decode(Favorites.self, from: data!)
                    if let favs = json.recommendfavorites {
                        self.favListRecc = favs
                    }
                } catch  {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self.collectionViewReccFavs.reloadData()
                }
            }
        }).resume()
    }
}

extension FavouriteScreen : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionViewFavs:
            return favList.count
        case collectionViewpopularFavs:
            return favListpopular.count
        case collectionViewReccFavs:
            return favListRecc.count
        default: return 0
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            
        case collectionViewFavs:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesViewCell.identifier, for: indexPath) as! FavoritesViewCell
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: URL(string:self.favList[indexPath.row].img!)!)
                DispatchQueue.main.async {
                    cell.favimgView.image = UIImage(data: data!)
                }
            }
            return cell
            
            
        case collectionViewpopularFavs:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularFavoritesViewCell.identifier, for: indexPath) as! PopularFavoritesViewCell
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: URL(string:self.favListpopular[indexPath.row].img!)!)
                DispatchQueue.main.async {
                    cell.favimgView.image = UIImage(data: data!)
                }
            }
            return cell
            
        case collectionViewReccFavs:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReccFavoritesViewCell.identifier, for: indexPath) as! ReccFavoritesViewCell
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: URL(string:self.favListRecc[indexPath.row].img!)!)
                DispatchQueue.main.async {
                    cell.favimgView.image = UIImage(data: data!)
                }
            }
            return cell
        
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case collectionViewFavs:
            let controller = BookDetail.instantiate()
            controller.product = favList[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        case collectionViewpopularFavs:
            let controller = PopularBookDetail.instantiate()
            controller.products = favListpopular[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        case collectionViewReccFavs:
            let controller = RecommendBookDetail.instantiate()
            controller.reccproducts = favListRecc[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        default:
            break
        }
    }
}


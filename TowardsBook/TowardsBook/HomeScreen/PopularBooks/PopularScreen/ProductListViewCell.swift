//
//  ProductListViewCell.swift
//  TowardsBook
//
//  Created by Maheen on 03/11/2022.
//

import UIKit

class ProductListViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ProductListViewCell.self)
    
    var closure: (()->())?
    
    @IBAction func btnAddBasket(_ sender: Any) {
        closure?()
    }
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
   
}

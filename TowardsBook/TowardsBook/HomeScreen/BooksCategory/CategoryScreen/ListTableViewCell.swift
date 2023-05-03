//
//  ListTableViewCell.swift
//  TowardsBook
//
//  Created by Maheen on 10/11/2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    
    static let identifier = String(describing: ListTableViewCell.self)
    
    var iPath : IndexPath?
    var closure: (()->())?
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var BookImageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    @IBAction func btnwebpdf(_ sender: Any) {
        closure?()
    }
    
}

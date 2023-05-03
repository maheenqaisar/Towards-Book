//
//  ReccTableViewCell.swift
//  TowardsBook
//
//  Created by Maheen on 25/12/2022.
//

import UIKit

class ReccTableViewCell: UITableViewCell {

    static let identifier = String(describing: ReccTableViewCell.self)
    
    var closure: (()->())?
    
    @IBAction func viewdoc(_ sender: Any) {
        closure?()
    }
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var BookImageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    
    
}

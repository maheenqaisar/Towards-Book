//
//  RecBookViewCell.swift
//  TowardsBook
//
//  Created by Maheen on 10/11/2022.
//

import UIKit

class RecBookViewCell: UICollectionViewCell {

    static let identifier = String(describing: RecBookViewCell.self)
   
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var BookImageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
   
}

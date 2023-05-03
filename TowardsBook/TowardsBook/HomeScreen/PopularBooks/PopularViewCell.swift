//
//  PopularViewCell.swift
//  TowardsBook
//
//  Created by Maheen on 10/11/2022.
//

import UIKit

class PopularViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PopularViewCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var BookImageView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    
}

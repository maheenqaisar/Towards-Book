//
//  OnboardingViewCell.swift
//  TowardsBook
//
//  Created by Maheen on 21/10/2022.
//

import UIKit

class OnboardingViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
}

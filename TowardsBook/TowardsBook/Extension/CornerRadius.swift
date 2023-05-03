//
//  CornerRadius.swift
//  TowardsBook
//
//  Created by Maheen on 21/10/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

//Image Extension

extension UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2.6
        self.clipsToBounds = true
    }
    
}

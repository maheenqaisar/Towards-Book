//
//  CardView.swift
//  TowardsBook
//
//  Created by Maheen on 10/11/2022.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.systemBackground.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.lightGray.cgColor
        cornerRadius = 10
    }
}

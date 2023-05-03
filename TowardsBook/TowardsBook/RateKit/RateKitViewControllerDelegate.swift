//
//  RateViewControllerDelegate.swift
//  TowardsBook
//
//  Created by Maheen on 28/12/2022.
//

import Foundation

public protocol RateKitViewControllerDelegate {
    func didChange(rate: Int)
    func didDismiss()
    func didSubmit(rate: Int)
}

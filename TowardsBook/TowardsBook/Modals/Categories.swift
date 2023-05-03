//
//  Categories.swift
//  TowardsBook
//
//  Created by Maheen on 03/12/2022.
//

import Foundation
// MARK: - Welcome
struct Categories : Codable {
    let categories: [Category]?
    let popularcategories: [Popular]?
    let recommendcategories: [Recommend]?
    let success: Int?
}

// MARK: - Category
struct Category : Codable {
    let id, name, img: String?
}
struct Popular : Codable {
    let id, name, price, description, img: String?
}
struct Recommend : Codable {
    let id, name, price, description, img: String?
    
}

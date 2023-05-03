//
//  Products.swift
//  TowardsBook
//
//  Created by Maheen on 03/12/2022.
//

import Foundation

struct Products : Codable {
    let products: [Product]?
    let popularproducts: [PopularProduct]?
    let recommendproducts: [RecommendProduct]?
    let success: Int?
}
// MARK: - Product
struct Product : Codable {
    let id, name, price, description, link, img: String?
}
struct PopularProduct : Codable {
    let id, name, price, description, link, img: String?
}
struct RecommendProduct : Codable {
    let id, name, price, description, link, img: String?
}

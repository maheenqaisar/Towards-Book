//
//  Favorites.swift
//  TowardsBook
//
//  Created by Maheen on 03/12/2022.
//

import Foundation

struct Favorites : Codable {
    let favorites: [Product]?
    let popularfavorites: [PopularProduct]?
    let recommendfavorites: [RecommendProduct]?
    let success: Int?
}

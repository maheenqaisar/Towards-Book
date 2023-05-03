//
//  Answer.swift
//  TowardsBook
//
//  Created by Maheen on 27/12/2022.
//

import Foundation

struct Answer {
    let text: String
    let type: PersonalityType
}

enum PersonalityType: Character {
    case creative = "🎨"
    case planner = "🌈"
    case explorer = "🔮"
    case independent = "💫"
    
    var definition: String {
        switch self {
        case .creative:
            return "You are extremely active. You surround yourself with those you love and enjoy interacting with friends"
        case .planner:
            return "You are reckless, but meek. Prefer to walk on your own."
        case .explorer:
            return "You like everything soft. You are healthy and full of energy."
        case .independent:
            return "You are smarter than your years, focus on the goal. You know that the slow but persistent always win."
        }
    }
}

//
//  Question.swift
//  TowardsBook
//
//  Created by Maheen on 27/12/2022.
//

import Foundation

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
    
    static let all: [Question] = [
        Question(text: "How often do you read when it is your choice?", type: .single, answers: [
            Answer(text: "Never", type: .creative),
            Answer(text: "1-2 times a week", type: .explorer),
            Answer(text: "2-3 times a week", type: .planner),
            Answer(text: "Everyday", type: .independent),
        ]),
        Question(text: "What motivates you to read?", type: .multiple, answers: [
            Answer(text: "School/University Assignments.", type: .explorer),
            Answer(text: "Recommendation from friends.", type: .creative),
            Answer(text: "Need for Information.", type: .planner),
            Answer(text: "I enjoy reading.", type: .independent),
        ]),
        Question(text: "How much time do you spend reading?", type: .range, answers: [
            Answer(text: "I don’t read", type: .independent),
            Answer(text: "Less than 15 minutes", type: .explorer),
            Answer(text: "15- 30 minutes", type: .creative),
            Answer(text: "More than an hour", type: .planner),
        ]),
        
    ]
}
enum ResponseType {
    case single, multiple, range
}

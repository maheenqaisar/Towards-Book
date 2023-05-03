//
//  ResultScreen.swift
//  TowardsBook
//
//  Created by Maheen on 27/12/2022.
//

import UIKit

class ResultScreen: UIViewController {

    @IBOutlet weak var personalityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let answers: [Answer]
    
    init?(coder: NSCoder,_ answers: [Answer]) {
        self.answers = answers
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("\(#line) \(#function) init(coder:) has not been implemented")
    }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = answers.reduce(into: [:]) { counts, answer in
            counts[answer.type, default: 0] += 1
        }

        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.value > $1.value }.first!.key
        updateUI(with: mostCommonAnswer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }
    
    func updateUI(with person: PersonalityType) {
        personalityLabel.text = "You are \(person.rawValue) !"
        descriptionLabel.text = person.definition
    }
    
}

//
//  QuestionScreen.swift
//  TowardsBook
//
//  Created by Maheen on 27/12/2022.
//

import UIKit

class QuestionScreen: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    
    @IBOutlet var multiSwitches: [UISwitch]!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    private var answersChosen = [Answer]() {
        didSet { print(#line, #function, answersChosen) }
    }
    
    private var currentAnswers: [Answer] { currentQuestion.answers }
    private var currentQuestion: Question { Question.all[questionIndex] }
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rangedSlider.maximumValue = 0.99999
        updateUI()
    }
    
    func updateUI() {
        func updateSingleStack() {
            singleStackView.isHidden = false
            for (index, button) in singleButtons.enumerated() {
                button.setTitle(nil, for: [])
                button.tag = index
            }
            for (button, answer) in zip(singleButtons, currentAnswers) {
                button.setTitle(answer.text, for: [])
            }
        }
        func updateMultipleStack() {
            multipleStackView.isHidden = false
            for label in multiLabels {
                label.text = nil
            }
            for (label, answer) in zip(multiLabels, currentAnswers) {
                label.text = answer.text
            }
        }
        func updateRangedStack() {
            rangedLabels.first?.text = currentAnswers.first?.text
            rangedLabels.last?.text = currentAnswers.last?.text
            rangedStackView.isHidden = false
        }
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        let totalProgress = Float(questionIndex)/Float(Question.all.count)
        navigationItem.title = "Question # \(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        switch currentQuestion.type {
            case .single:
                updateSingleStack()
            case .multiple:
                updateMultipleStack()
            case .range:
                updateRangedStack()
        }
    }
      
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < Question.all.count {
        updateUI()
        } else {
            performSegue(withIdentifier: "Result", sender: nil)
        }
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = Question.all[questionIndex].answers
        let index = sender.tag
        guard 0 <= index && index < answers.count else {
            return
        }
        let answer = answers[index]
        answersChosen.append(answer)
        nextQuestion()
    }
    
    @IBAction func multiButtonPressed() {
        for (index, multiSwitch) in multiSwitches.enumerated() {
            if multiSwitch.isOn && index < currentAnswers.count {
            let answer = currentAnswers[index]
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func randomButtonPressed() {
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        if index < currentAnswers.count {
            let answer = currentAnswers[index]
            answersChosen.append(answer)
        }
        nextQuestion()
    }
    
    @IBSegueAction func resultsSegue(_ coder: NSCoder) -> ResultScreen? {
        return ResultScreen(coder: coder, answersChosen)
    }
}

//
//  DestinationViewController.swift
//  SuperMatematician
//
//  Created by  Тима on 29.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func setText(text: String)
}

class DestinationViewController: UIViewController {
    
    weak var delegate: ViewControllerDelegate?
    var myString = String()

    let numbers = [0: 9, 1: 99, 2: 99, 3: 999]
    var timer: Timer = Timer()
    var timer2: Timer = Timer()
    var equation: String = ""
    var equals: Int = 0
    var counter: Int = 0
    var count = 5
    var IsFirstLoad: Bool = true
    var levelRecognizer: String = ""
    var speed = 5
    var score = 0.0
    var text: String!
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var equationTextField: UITextField!
//    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewReal: UIView!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    @IBOutlet weak var redLineOutlet: UIView!
    
    
//    @IBAction func backButtonPressed(_ sender: Any)
//    {
////        if submitButton.isEnabled == false {
////            performSegue(withIdentifier: "segue", sender: self)
//        delegate?.setText(text: "\(score) 123")
//        print("\(score)")
//
//        self.navigationController?.popViewController(animated: true)
//        performSegue(withIdentifier: "backSeg", sender: self)
//
//    }
    @IBAction func backButtonPressed(_ sender: Any) {
        delegate?.setText(text: "\(score) 123")
        print("\(score)")
        
        self.navigationController?.popViewController(animated: true)
//        performSegue(withIdentifier: "backSeg", sender: self)
    }
    
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func submitButtonPressed(_ sender: Any)
    {
        if equationTextField.text == "\(equals)" {
            if levelRecognizer == "1" {
                newQuestion()
                count = 5
                score += 1
                scoreLabel.text = "Score: \(score)"
                equationTextField.text = ""
            } else if levelRecognizer == "2" {
                newQuestion()
                count = 5
                score += 1
                scoreLabel.text = "Score: \(score)"
                equationTextField.text = ""
            } else if levelRecognizer == "3" {
                newQuestion()
                count = 15
                score += 1
                scoreLabel.text = "Score: \(score)"
                equationTextField.text = ""
            } else if levelRecognizer == "4" {
                newQuestion()
                count = 30
                score += 1
                scoreLabel.text = "Score: \(score)"
                equationTextField.text = ""
            }
            
        } else {
            score -= 0.5
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    
    var gradient: CAGradientLayer!
    var gradientBack: CAGradientLayer!
    
    func runTimer(){
        var time: Double
        switch levelRecognizer{
        case "1":
             time = 0.18
        case "2":
             time = 0.18
        case "3":
             time = 0.45
        case "4":
             time = 0.9
        default:
             time = 0.18
        }
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(time), target: self, selector: #selector(moveQuestionLabel), userInfo: speed, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelRecognizer = text
//        levelRecognizer = myString
        print(levelRecognizer)
        newQuestion()
        
        gradient = CAGradientLayer()
        gradient.position = CGPoint(x:206,y:255)
        gradient.cornerRadius = 10
        gradient.bounds = redLineOutlet.frame
        gradient.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        view.layer.addSublayer(gradient)
        view.layer.insertSublayer(gradient, at: 1)
        
        scoreLabel.alpha = 0.8
        
        runTimer()
    }
    
    @objc func moveQuestionLabel() {
        if(equationLabel.center.y >= bottomViewReal.center.y) {newQuestion()}
        UIView.animate(withDuration: 1.2) {
            self.equationLabel.center.y += CGFloat(5)
    }
    }
    
    var x: Int = 0
    var y: Int = 0
    
    func newQuestion() {
        if levelRecognizer == "1" {
            x = Int(arc4random_uniform(9) + 1)
            y = Int(arc4random_uniform(9) + 1)
            equationLabel.text = "\(x) * \(y) ="
            equals = x * y
            count = 5
        } else if levelRecognizer == "2" {
            x = Int(arc4random_uniform(99) + 1)
            y = Int(arc4random_uniform(9) + 1)
            equationLabel.text = "\(x) x \(y) ="
            equals = x * y
            count = 5
        } else if levelRecognizer == "3" {
            x = Int(arc4random_uniform(99) + 1)
            y = Int(arc4random_uniform(99) + 1)
            equationLabel.text = "\(x) x \(y) ="
            equals = x * y
            count = 15
        } else {
            x = Int(arc4random_uniform(999) + 1)
            y = Int(arc4random_uniform(99) + 1)
            equationLabel.text = "\(x) x \(y) ="
            equals = x * y
            count = 30
        }
        
        equationLabel.center.y = 50
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        [timer, timer2].forEach({ $0.invalidate()})
    }
    
    @objc func timerAction(){
        if count > 0 {
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            timerLabel.text = "Time: " + minutes + ":" + seconds
            count -= 1
        } else {
            timer.invalidate()
            timer2.invalidate()
            scoreLabel.text = ""
            timerLabel.text = "Time: IS OVER"
            equationLabel.text = ""
            alert()
            submitButton.isEnabled = false
            submitButton.alpha = 0.5
        }
    }
    
//    var submitAction: UIAlertAction
    func alert(){
        let ac = UIAlertController(title: "Enter your name", message: "Your score is \(score) \n You can save it!", preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            print("\(String(describing: answer.text))")
            // do something interesting with "answer" here
        }
        
        ac.addAction(submitAction)
        
        present(ac, animated: true)
        
    }
    
//    @IBAction func unwind(_ segue: UIStoryboardSegue) {
//        let destinationViewController = segue.source as! MathViewController
//            destinationViewController.myString2 = "\(score)"
//            print(score)
//    }
    
//    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
//
//        // Use data from the view controller which initiated the unwind segue
//    }
//
//    @IBAction func unwindWithSegue(segue: UIStoryboardSegue) {
////        let destinationViewController = segue.source as! MathViewController
////                    destinationViewController.myString2 = "\(score)"
////                    print(score)
//    }
    
    @IBAction func unwindToBack(_ sender: UIStoryboardSegue) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

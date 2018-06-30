//
//  DestinationViewController.swift
//  SuperMatematician
//
//  Created by  Тима on 29.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit

//protocol ViewControllerDelegate: AnyObject {
//    func setText(text: String)
//}

class DestinationViewController: UIViewController {
    
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
    var score = 0
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var equationTextField: UITextField!
//    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewReal: UIView!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    @IBOutlet weak var redLineOutlet: UIView!
    
    
    @IBAction func backButtonPressed(_ sender: Any)
    {
//        if submitButton.isEnabled == false {
//            performSegue(withIdentifier: "segueBack", sender: self)
//        }
        
    }
    
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func submitButtonPressed(_ sender: Any)
    {
        if equationTextField.text == "\(equals)" {
            newQuestion()
            count = 5
            score += 1
            scoreLabel.text = "Score: \(score)"
            equationTextField.text = ""
        } else {
            score -= 2
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    
    var gradient: CAGradientLayer!
    var gradientBack: CAGradientLayer!
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(0.15), target: self, selector: #selector(moveQuestionLabel), userInfo: speed, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.label.text = text
        levelRecognizer = myString
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
        x = Int(arc4random_uniform(9) + 1)
        y = Int(arc4random_uniform(9) + 1)
        equationLabel.text = "\(x) x \(y) ="
        equationLabel.center.y = 50
        equals = x * y
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
    
    
    func alert(){
        let ac = UIAlertController(title: "Enter your name", message: "Your score is \(score) \n You can save it!", preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            // do something interesting with "answer" here
        }
        
        ac.addAction(submitAction)
        
        present(ac, animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segueBack" {
//
//            let destinationViewController2 = segue.destination as! MathViewController
//            destinationViewController2.myString2 = "\(score)"
//
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

//
//  MathViewController.swift
//  SuperMatematician
//
//  Created by  Тима on 29.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit

class MathViewController: UIViewController, ViewControllerDelegate {
    func setText(text: String) {
            scoreOutlet.text = text
    }
    
    
    var myString2 = String()
    
    @IBOutlet weak var scoreOutlet: UILabel!
    
    @IBAction func rulesMath(_ sender: Any)
    {
        let alert = UIAlertController(title: "The Rules",
                                      message: "Welcome to the Math Guesser! \n \n 1) Choose the hard level \n 2) You will have several seconds to answer the following equation \n 3) Write the answer and press 'NEXT' \n \n * For each right answer you will get 1 point \n * For each wrong answer you lose 0.5 points \n * Game will be over when the time will be over \n \n ENJOY!",
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    var hardLevel: String = ""
    
    @IBOutlet weak var easyButtonOutlet: UIButton!
    @IBAction func easyButton(_ sender: Any)
    {
        setAlphaToHalf()
        easyButtonOutlet.alpha = 1
        hardLevel = "1"
        startButtonOutlet.isEnabled = true
    }
    
    @IBOutlet weak var mediumButtonOutlet: UIButton!
    @IBAction func mediumButton(_ sender: Any)
    {
        setAlphaToHalf()
        mediumButtonOutlet.alpha = 1
        hardLevel = "2"
        startButtonOutlet.isEnabled = true
    }
    
    
    @IBOutlet weak var hardButtonOutlet: UIButton!
    @IBAction func hardButton(_ sender: Any)
    {
        setAlphaToHalf()
        hardButtonOutlet.alpha = 1
        hardLevel = "3"
        startButtonOutlet.isEnabled = true
    }
    
    @IBOutlet weak var hellButtonOutlet: UIButton!
    @IBAction func hellButton(_ sender: Any)
    {
        setAlphaToHalf()
        hellButtonOutlet.alpha = 1
        hardLevel = "4"
        startButtonOutlet.isEnabled = true
    }
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBAction func startButtonPressed(_ sender: Any)
    {
        if startButtonOutlet.isEnabled == true {
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    func setAlphaToHalf(){
        hardButtonOutlet.alpha = 0.5
        easyButtonOutlet.alpha = 0.5
        hellButtonOutlet.alpha = 0.5
        mediumButtonOutlet.alpha = 0.5
    }
    
    var gradient: CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.blue.cgColor, UIColor.cyan.cgColor]
        view.layer.addSublayer(gradient)
        view.layer.insertSublayer(gradient, at: 0)
        
        easyButtonOutlet.layer.masksToBounds = true
        easyButtonOutlet.layer.cornerRadius = 30
        mediumButtonOutlet.layer.masksToBounds = true
        mediumButtonOutlet.layer.cornerRadius = 30
        hardButtonOutlet.layer.masksToBounds = true
        hardButtonOutlet.layer.cornerRadius = 30
        hellButtonOutlet.layer.masksToBounds = true
        hellButtonOutlet.layer.cornerRadius = 30
        startButtonOutlet.layer.masksToBounds = true
        startButtonOutlet.layer.cornerRadius = 20
        
        scoreOutlet.text = "Score: \(myString2)"
        
        startButtonOutlet.isEnabled = false
        
        setAlphaToHalf()
        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segue" {
//
//            let destinationViewController = segue.destination as! DestinationViewController
//            destinationViewController.myString = hardLevel
//            destinationViewController.delegate = self
//
//        }
        if segue.identifier == "segue" {

            if let dvc = segue.destination as? DestinationViewController {
                dvc.text = hardLevel
                dvc.delegate = self
            }

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}

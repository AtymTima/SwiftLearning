//
//  ViewController.swift
//  SuperMatematician
//
//  Created by  Тима on 29.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit
//import CoreData

class ViewController: UIViewController {
    
    var score = 0.0
    var check = true
    var rnd: String = ""
    var mistake = 0
    var mess: String = ""
    var colorSet = ["red","brown","blue","cyan","orange","green","purple"]
    var randomColor: String = ""
    var bestScore = 0.0
    
    @IBAction func rulesAlert(_ sender: Any)
    {
        let alert = UIAlertController(title: "The Rules",
                                      message: "Welcome to the Color Guesser! \n \n 1) Press the 'start' button \n 2) If the background color of the box matches the name of the color, press 'TRUE' button \n 3)Otherwise, press 'FALSE' button \n \n * For each right answer you get 0.5 points \n * For each wrong answer you lose 5 points \n * Game will be over when you will have no points or will make 2 mistakes \n \n ENJOY!",
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
    
    @IBOutlet weak var labelShowNewColor: UIButton!
    
    @IBOutlet weak var trueOutlet: UIButton!
    @IBAction func trueButtonPressed(_ sender: Any)
    {
        if check == true {
            score += 0.5
            mistake = 0
        } else {
            score -= 5
            mistake += 1
        }
        checkScores()
    }
    
    
    @IBOutlet weak var falseOutlet: UIButton!
    @IBAction func falseButtonPressed(_ sender: Any)
    {
        if check == false {
            score += 0.5
            mistake = 0
        } else {
            score -= 5
            mistake += 1
        }
        checkScores()
    }
    
    func checkScores() {
        scoreOutlet.text = "SCORE: \(score)"
        if score >= 0 && mistake < 2 {
           theGame()
        } else {
            if score < 0 {
                mess = "Really?"
            } else if score > 0 && score < 5 {
                mess = "\(score) points... You are LOSER!"
            } else if score >= 5 && score < 10 {
                mess = "\(score) points. Not pretty smart"
            } else if score >= 10{
                mess = "\(score), that's more than 10, is it really interesting to play it? Or you got that score in random? "
            }
            
            let alert = UIAlertController(title: "GAME IS OVER",
                                          message: "\(mess)",
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
            
            if score < 0 {
                score = 0
            }
            
            labelShowNewColor.backgroundColor = UIColor.clear
            startButtonOutlet.isEnabled = true
            startButtonOutlet.setTitle("START", for: .normal)
            labelShowNewColor.setTitle("READY?", for: .normal)
            trueOutlet.isEnabled = false
            falseOutlet.isEnabled = false
            if score > bestScore {
                bestScore = score
                bestOutler.text = "BEST SCORE: \(bestScore)"
            }
            
            scoreOutlet.text = "LAST SCORE: \(score)"
            score = 0
            trueOutlet.alpha = 0.5
            falseOutlet.alpha = 0.5
            UserDefaults.standard.set(scoreOutlet.text, forKey: "lastScore")
            UserDefaults.standard.set(bestOutler.text, forKey: "bestScore")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "lastScore") as? String{
            scoreOutlet.text = x
        }
        if let y = UserDefaults.standard.object(forKey: "bestScore") as? String{
            bestOutler.text = y
        }
    }
//    var color = UIColor()
//    var diyColor = String()
    
    func getRealColor() -> String{
        let randomActualColor = Int(arc4random_uniform(UInt32(colorSet.count)))
        return (colorSet[randomActualColor])
    }
    
    func getRandomColor() -> UIColor{
        //Generate between 0 to 1
//        let red:CGFloat = CGFloat(drand48())
//        let green:CGFloat = CGFloat(drand48())
//        let blue:CGFloat = CGFloat(drand48())
//        color = UIColor(red:red, green: green, blue: blue, alpha: 1.0)
//        diyColor = String(describing: color)
//        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
        
        rnd = getRealColor()
        switch rnd{
            case "red":
                return UIColor.red
            case "brown":
                return UIColor.brown
            case "blue":
                return UIColor.blue
            case "cyan":
                return UIColor.cyan
            case "orange":
                return UIColor.orange
            case "green":
                return UIColor.green
            case "purple":
                return UIColor.purple
            default:
                return UIColor.red
        }
        
    }
    
    
    
    func getRandomElementFromSet() -> String{
        let randomIndex = Int(arc4random_uniform(UInt32(colorSet.count)))
        return (colorSet[randomIndex])
    }
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBAction func startButtonPressed(_ sender: Any) {
        theGame()
        startButtonOutlet.isEnabled = false
        startButtonOutlet.setTitle("GOOD LUCK", for: .normal)
        trueOutlet.isEnabled = true
        falseOutlet.isEnabled = true
        scoreOutlet.text = "SCORE: 0"
        trueOutlet.alpha = 1
        falseOutlet.alpha = 1
    }
    
    func theGame() {
        randomColor = getRandomElementFromSet()
        UIView.animate(withDuration: 1, animations: {
            self.labelShowNewColor.backgroundColor = self.getRandomColor()
        }, completion: nil)
        labelShowNewColor.setTitle("\(randomColor)", for: .normal)
        if randomColor == rnd {
            check = true
            print(check)
        } else {
            check = false
            print(check)
        }
    }
    
    
    @IBOutlet weak var scoreOutlet: UILabel!
    @IBOutlet weak var bestOutler: UILabel!
    
    var gradient: CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.magenta.cgColor, UIColor.yellow.cgColor]
        view.layer.addSublayer(gradient)
        view.layer.insertSublayer(gradient, at: 0)
        
        labelShowNewColor.layer.masksToBounds = true
        labelShowNewColor.layer.cornerRadius = 15
        trueOutlet.layer.masksToBounds = true
        trueOutlet.layer.cornerRadius = 40
        falseOutlet.layer.masksToBounds = true
        falseOutlet.layer.cornerRadius = 40
        startButtonOutlet.layer.masksToBounds = true
        startButtonOutlet.layer.cornerRadius = 20
        trueOutlet.isEnabled = false
        falseOutlet.isEnabled = false
        
        trueOutlet.alpha = 0.5
        falseOutlet.alpha = 0.5
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        let newRecord = NSEntityDescription.insertNewObject(forEntityName: "Records", into: context)
//        newRecord.setValue("\(bestScore)", forKey: "bestscore")
//        do
//        {
//            try context.save()
//        }
//        catch
//        {
//            // PROCESS ERROR
//        }
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Records")
//        request.returnsObjectsAsFaults = false
//
//        do
//        {
//            let results = try context.fetch(request)
//            if results.count > 0 {
//                for result in results as! [NSManagedObject] {
//                    if let bestcore = result.value(forKey: "bestscore") as? Double {
//                            print(bestcore)
//                    }
//                }
//            }
//        }
//        catch
//        {
//
//        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}


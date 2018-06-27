//
//  ViewController.swift
//  Responsive AHKETA
//
//  Created by  Тима on 27.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit
let button = UIButton(type: UIButtonType.system) as UIButton
var currentValue = 600
var currentGender = 0
var showGender = "Girl"

class ViewController: UIViewController {

    @IBOutlet weak var Hero: UITextField!
    
    @IBAction func genderValue(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 1){
            currentGender = 0
        } else {
            currentGender = 1
        }
        switch currentGender{
        case 0:
            showGender = "not a Girl"
        default:
            showGender = "a Girl"
        }
    }
    
    @IBOutlet weak var dateShow: UIDatePicker!
    
    
    @IBAction func sureOn(_ sender: UISwitch) {
        if (sender.isOn == true) {
            button.isEnabled = true
        } else {
            button.isEnabled = false
        }
    }
    
    @IBAction func weightKG(_ sender: UISlider) {
        currentValue = Int(sender.value)
        weightShow.text = "\(currentValue) KG"
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        view.frame.origin.y = 0
        view.resignFirstResponder()
        if !(button.isEnabled == true) {
        } else {
            let alert = UIAlertController(title: "My AHKETA",
                                          message: "Villains should be terrified, there is a new Hero -  \(Hero.text ?? "unknown"). I am \(showGender), I will not die until \(dateShow.date), believe! My weight is \(currentValue) KG, but its't not important!",
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
    }
    
    @IBOutlet weak var weightShow: UILabel!
    
    var gradient: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fade out to set the text
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.view.alpha = 0.0
        }, completion: {
            (finished: Bool) -> Void in
            
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.view.alpha = 1.0
            }, completion: nil)
        })
        
        weightShow.text = "600 KG"
        // Do any additional setup after loading the view, typically from a nib.
        gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.blue.cgColor, UIColor.purple.cgColor]
        view.layer.addSublayer(gradient)
        view.layer.insertSublayer(gradient, at: 0)
        button.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    
    @objc func keyboardWillChange(notification: Notification){
        guard let keyboardReact = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
            return
        }
        
        if notification.name == Notification.Name.UIKeyboardWillShow || notification.name == Notification.Name.UIKeyboardWillShow {
            
            UIKeyboardAppearance.alert
            view.frame.origin.y = -keyboardReact.height
        } else {
            view.frame.origin.y = 0
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


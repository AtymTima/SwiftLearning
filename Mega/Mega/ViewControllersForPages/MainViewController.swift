//
//  ViewController.swift
//  Mega
//
//  Created by  Тима on 04.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
   
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var balanceTextField: UITextField!
    @IBOutlet weak var enterButtonPressed: UIButton!
    @IBAction func enterButtonClickedAction(_ sender: Any)
    {
    }
    
    @IBOutlet weak var chooseAva: UIImageView!
    @IBOutlet weak var chooseCityPickerView: UIPickerView!
    
    var selectedCity: String = ""
    
    let listOfCities = ["Не выбрано", "Алма-Ата", "Астана", "Шымкент", "Караганда", "Актобе", "Тараз", "Павлодар", "Семей", "Усть-каменогорск", "Уральск", "Костанай", "Петропавловск", "Кызылорда", "Атырау", "Актау", "Темиртау", "Туркестан", "Кокшетау", "Талдыкорган", "Екибастуз"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToMainScreen"
        {
            var chosenUsername = nameTextField.text
            var chosenBalance = Int(balanceTextField.text!)
//            let chosenCity = String(cityPickerView)

            let barViewControllers = segue.destination as! UITabBarController
            let nav = barViewControllers.viewControllers![3] as! UINavigationController
            let destinationViewController = nav.topViewController as! ProfileViewController
            if chosenUsername == ""
            {
                chosenUsername = "Аноним"
            }
            destinationViewController.chosenUsername = chosenUsername!
            if selectedCity == ""
            {
                selectedCity = "Не выбрано"
            }
            destinationViewController.chosenCity = selectedCity
            if balanceTextField.text! == ""
            {
                chosenBalance = 0
            }
            destinationViewController.chosenBalance = chosenBalance!
            
            let forPayingVC = segue.destination as! UITabBarController
            let toPayVC = forPayingVC.viewControllers![0] as! UINavigationController
            let destinationPayVC = toPayVC.topViewController as! FoodViewController
            destinationPayVC.balanceOfUser = chosenBalance!
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .default
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController?
    {
        return self.navigationController
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        chooseAvaAfterTapping()
        let newCornerStyle = roundCornerStyle()
        newCornerStyle.makeSmoothCorners(object: enterButtonPressed)
        newCornerStyle.makeRoundCorners(object: chooseAva)
        nameTextField.changeTextFieldStyle()
        balanceTextField.changeTextFieldStyle()
        setNeedsStatusBarAppearanceUpdate()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}}


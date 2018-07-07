//
//  ProfileViewController.swift
//  Mega
//
//  Created by  Тима on 04.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit
import Foundation

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var viewWithUserData: UIView!
    @IBOutlet weak var profileTabBar: UITabBarItem!
    
    var chosenUsername: String = "Мистер Аноним"
    var chosenCity: String = "Не выбран"
    var chosenBalance: Int = 0
    var checkCell: Int = 0
    
    
    lazy var user = User(chosenUsername: chosenUsername, chosenBalance: chosenBalance)

    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        roundCornerStyle().makeRoundView(object: viewWithUserData)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}}

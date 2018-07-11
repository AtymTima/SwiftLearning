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
    
    @IBOutlet weak var avaOfTheUser: UIImageView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var viewWithUserData: UIView!
    @IBOutlet weak var profileTabBar: UITabBarItem!
    
    var chosenUsername: String = "Мистер Аноним"
    var chosenCity: String = "Не выбран"
    var chosenBalance: Int = 0
    var checkCell: Int = 0
    var chosenAva: UIImage?
    
//    lazy var user = User(chosenUsername: chosenUsername, chosenBalance: chosenBalance)

    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        roundCornerStyle().makeRoundView(object: viewWithUserData)
        self.setNeedsStatusBarAppearanceUpdate()
        if chosenAva != nil
        {
            avaOfTheUser.image = chosenAva
        }
        
        let newCornerStyle = roundCornerStyle()
        newCornerStyle.makeRoundCorners(object: avaOfTheUser)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}}

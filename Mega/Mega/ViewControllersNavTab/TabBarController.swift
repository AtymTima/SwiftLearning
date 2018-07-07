//
//  TabBarController.swift
//  Mega
//
//  Created by  Тима on 04.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {


    @IBOutlet weak var tabBarStyle: UITabBar!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tabBarStyle.changeStyleTabBar()
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}}

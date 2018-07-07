//
//  NavBarController.swift
//  Mega
//
//  Created by  Тима on 04.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit

class NavBarController: UINavigationController {

    @IBOutlet weak var navBarStyleFood: UINavigationBar!
    @IBOutlet weak var navBarStyleClothes: UINavigationBar!
    @IBOutlet weak var navBarStyleBasket: UINavigationBar!
    @IBOutlet weak var navBarStyleProfile: UINavigationBar!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationBar.changeStyleNavigationBar()
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}}

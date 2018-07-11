//
//  ClothesScrollingViewController.swift
//  Mega
//
//  Created by  Тима on 06.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher
import SwiftyJSON
import Alamofire

class ClothesScrollingViewController: UIViewController {

    @IBAction func addToBasketButtonPressed(_ sender: Any)
    {
        
    }
    @IBOutlet weak var nameOfChosenCompany: UILabel!
    @IBOutlet weak var descriptionOfProduct: UITextView!
    @IBOutlet weak var theSizeOfProduct: UIPickerView!
    @IBOutlet weak var nameOfProduct: UILabel!
    @IBOutlet weak var collectionViewScrolling: UICollectionView!
    @IBAction func backButtonPressed(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    var identifierForSpecificPage: Int = 0
    var productClothesName: String = ""
    var imageOfProductClothes: String! = ""
    var nameOfCompany: String = ""
    var descriptionOfCompany: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameOfChosenCompany.text = nameOfCompany
        descriptionOfProduct.text = descriptionOfCompany
        nameOfProduct.text = productClothesName
        
        UINavigationBar.appearance().tintColor = UIColor.white
        self.title = "\(nameOfCompany)"
    }
    
    override func viewDidAppear(_ animated: Bool)
    {

        
//        let itemSize = UIScreen.main.bounds.width
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
//        layout.itemSize = CGSize(width: itemSize, height: 266)
//        layout.minimumLineSpacing = 2
//        layout.minimumInteritemSpacing = 2
//        collectionViewScrolling.collectionViewLayout = layout
        
        self.setNeedsStatusBarAppearanceUpdate()
        collectionViewScrolling.addRefreshControlToCollectionView(object: collectionViewScrolling)
        CollectingViews().reloadCollectionWithDelay(objectCollection: self.collectionViewScrolling)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}}

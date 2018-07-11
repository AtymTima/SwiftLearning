//
//  BasketViewController.swift
//  Mega
//
//  Created by  Тима on 04.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import Kingfisher
import SwiftyJSON

class BasketViewController: UIViewController {

    @IBOutlet weak var collectionForCard: UICollectionView!
    var card = Card(){
        didSet{
            print("SET CARD IN BASKET")
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        collectionForCard.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}}

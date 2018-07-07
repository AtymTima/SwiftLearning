//
//  ClothesViewController.swift
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

class ClothesViewController: UIViewController {
    
    

    @IBOutlet weak var clothesCollectionView: UICollectionView!
    @IBOutlet weak var clothesTabBar: UITabBarItem!
    
    var namesOfCompany: [String] = []
    var descriptionsOfCompany: [String] = []
    var logosOfCompany: [String] = []
    var idOfCompanies: [Int] = []
    var checkIfTheUserEntered: Int = 0
    var numberOfPage: Int = 0
    let sizes:[CGSize] = [CGSize(width:320, height:260),CGSize(width:320, height:160),CGSize(width:320, height:100)]
    
    
    func parseJson(){
        Alamofire.request("https://megaapi.herokuapp.com/api/cloth", method: .get).validate().responseJSON { response in
            if let json = response.data {
                do{
                    let list = try JSON(data: json)
                    let array = list["data"]
                    for i in array
                    {
                        self.logosOfCompany.append(i.1["logoUrl"].string!)
                        self.namesOfCompany.append(i.1["name"].string!)
                        self.descriptionsOfCompany.append(i.1["description"].string!)
                        self.idOfCompanies.append(i.1["id"].int!)
                    }
                } catch {
                    print("error")
                }
            }
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        clothesCollectionView.changeStyleOfCollectionView(object: clothesCollectionView)
        if checkIfTheUserEntered == 0
        {
            parseJson()
            checkIfTheUserEntered += 1
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        let request = Alamofire.request("https://megaapi.herokuapp.com/api/cloth")
        request.cancel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        CollectingViews().reloadCollectionWithDelay(objectCollection: self.clothesCollectionView)
        clothesCollectionView.addRefreshControlToCollectionView(object: clothesCollectionView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToDetailedClothes"
        {
            let nav = segue.destination as! UINavigationController
            let destinationViewController = nav.topViewController as! ClothesDetailedViewController
            destinationViewController.numberOfPage = numberOfPage
            destinationViewController.nameOfCompany = namesOfCompany
            destinationViewController.descriptionOfCompany = descriptionsOfCompany[numberOfPage]
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}}

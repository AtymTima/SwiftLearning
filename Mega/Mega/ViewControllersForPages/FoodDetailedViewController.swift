//
//  ClothesDetailedViewController.swift
//  Mega
//
//  Created by  Тима on 05.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import Foundation

class FoodDetailedViewController: UIViewController
{
    
    func setUp(order: ProductFood) {
        if let basketVC = tabBarController?.viewControllers![2] as? BasketViewController{
            basketVC.intoCardInsert(order: order)
        }
    }
    
    @IBOutlet weak var logoOfCompanyBanner: UIImageView!
    @IBOutlet weak var collectionViewFoodDetailed: UICollectionView!
    @IBOutlet weak var averageCheckOfCompany: UILabel!
    @IBAction func backButtonPressed(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
            var indexOfPage: Int = 0
            var name: [String] = []
            var logoUrl: [String] = []
            var pricesOfProducts: [Int] = []
            var type: [String] = []
            var averageCheck: Int = 0
            var headerOfCompany: [String] = []
            var nameOfCompany: [String] = []
            var balanceOfUser: Int = 0
            var successAnswer: String = "The product was successfully added to the cart!"
            var failureAnswer: String = "The balance is not enough, return later!"
            var numberOfChosenProduct: Int = 0
    
    var totalSum: Int = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()
        parseJson()
        
        let mainLogo = URL(string: headerOfCompany[indexOfPage])
        logoOfCompanyBanner.kf.setImage(with: mainLogo)
        UINavigationBar.appearance().tintColor = UIColor.white
        self.title = "\(nameOfCompany[indexOfPage])"
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        let request = Alamofire.request("https://megaapi.herokuapp.com/api/food/id")
        request.cancel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        CollectingViews().reloadCollectionWithDelay(objectCollection: self.collectionViewFoodDetailed)
        collectionViewFoodDetailed.addRefreshControlToCollectionView(object: collectionViewFoodDetailed)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func parseJson(){
        Alamofire.request("https://megaapi.herokuapp.com/api/food/id/\(indexOfPage)", method: .get).validate().responseJSON { response in
            if let json = response.data {
                do{
                    let list = try JSON(data: json)
                    let array = list["data"]
                    for i in array
                    {
                        self.logoUrl.append(i.1["logoUrl"].string!)
                        self.name.append(i.1["name"].string!)
                        self.pricesOfProducts.append(i.1["price"].int!)
                        self.type.append(i.1["type"].string!)
                    }
                } catch {
                    print("error")
                }
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}}

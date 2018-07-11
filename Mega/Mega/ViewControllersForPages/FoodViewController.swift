//
//  FoodViewController.swift
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

class FoodViewController: UIViewController
{
    
    @IBOutlet weak var tableViewFood: UITableView!
    @IBOutlet weak var foodTabBar: UITabBarItem!
    
    var namesOfCompany: [String] = []
    var descriptionsOfCompany: [String] = []
    var ratingsOfCompany: [Int] = []
    var averageChecksOfCompany: [Int] = []
    var logosOfCompany: [String] = []
    var idOfCompanies: [Int] = []
    var checkIfTheUserEntered: Int = 0
    var indexOfPage: Int = 0
    var headerOfCompany: [String] = []
    var balanceOfUser: Int = 0

    func parseJson(){
        Alamofire.request("https://megaapi.herokuapp.com/api/food", method: .get).validate().responseJSON { response in
            if let json = response.data {
                do{
                    let list = try JSON(data: json)
                    let array = list["data"]
                    for i in array
                    {
                        self.logosOfCompany.append(i.1["logoUrl"].string!)
                        self.namesOfCompany.append(i.1["name"].string!)
                        self.descriptionsOfCompany.append(i.1["description"].string!)
                        self.averageChecksOfCompany.append(i.1["averageCheck"].int!)
                        self.ratingsOfCompany.append(i.1["averageRating"].int!)
                        self.idOfCompanies.append(i.1["id"].int!)
                        self.headerOfCompany.append(i.1["header"].string!)
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
        if checkIfTheUserEntered == 0
        {
            parseJson()
            checkIfTheUserEntered += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        let request = Alamofire.request("https://megaapi.herokuapp.com/api/food")
        request.cancel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        CollectingViews().reloadTableWithDelay(objectTable: self.tableViewFood)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToDetailedFood"
        {
            let nav = segue.destination as! UINavigationController
            let destinationViewController = nav.topViewController as! FoodDetailedViewController
            destinationViewController.indexOfPage = indexOfPage
            destinationViewController.headerOfCompany = headerOfCompany
            destinationViewController.nameOfCompany = namesOfCompany
            destinationViewController.balanceOfUser = balanceOfUser
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}}

//
//  ClothesDetailedViewController.swift
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

class ClothesDetailedViewController: UIViewController {

    var productClothesName: [String] = []
    var productClothesPrice: [Int] = []
    var productClothesImage: [String] = []
    var productClothesType: [String] = []
    var numberOfPage: Int = 0
    var nameOfCompany: [String] = []
    var currentSegment: Int = 0
    var filteredShoesList: [String] = []
    var filteredGarmentList: [String] = []
    var identifierForSpecificPage: Int = 0
    var descriptionOfCompany: String = ""

    @IBOutlet weak var viewEmptyState: UIView!
    @IBOutlet weak var selectedCategoryOutlet: UISegmentedControl!
    @IBAction func selectedCategoryAction(_ sender: Any)
    {
        if selectedCategoryOutlet.selectedSegmentIndex == 0
        {
            currentSegment = 0
            viewEmptyState.isHidden = true
            
        } else if selectedCategoryOutlet.selectedSegmentIndex == 1
        {
            currentSegment = 1
            if filteredShoesList.count == 0
            {
                viewEmptyState.isHidden = false
            } else { viewEmptyState.isHidden = true }
            
        } else if selectedCategoryOutlet.selectedSegmentIndex == 2
        {
            currentSegment = 2
            if filteredGarmentList.count == 0
            {
                viewEmptyState.isHidden = false
            } else { viewEmptyState.isHidden = true }
        }
        collectionViewCLothesDetailed.reloadData()
    }
   
    
    
    @IBOutlet weak var collectionViewCLothesDetailed: UICollectionView!
    @IBAction func backToClothesButtonPressed(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        parseJson()
        collectionViewCLothesDetailed.changeStyleOfCollectionView(object: collectionViewCLothesDetailed)
        UINavigationBar.appearance().tintColor = UIColor.white
        self.title = "\(nameOfCompany[numberOfPage])"
        
    }
    
    func parseJson(){
        Alamofire.request("https://megaapi.herokuapp.com/api/cloth/id/\(numberOfPage)", method: .get).validate().responseJSON { response in
            if let json = response.data {
                do{
                    let list = try JSON(data: json)
                    let array = list["data"]
                    for i in array
                    {
                        self.productClothesImage.append(i.1["logoUrl"].string!)
                        self.productClothesName.append(i.1["name"].string!)
                        self.productClothesPrice.append(i.1["price"].int!)
                        self.productClothesType.append(i.1["type"].string!)
                    }
                } catch {
                    print("error")
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        CollectingViews().reloadCollectionWithDelay(objectCollection: self.collectionViewCLothesDetailed)
        self.setNeedsStatusBarAppearanceUpdate()
        collectionViewCLothesDetailed.addRefreshControlToCollectionView(object: collectionViewCLothesDetailed)
        
        for index in 0..<productClothesName.count{
            if productClothesType[index].contains("shoes")
            {
                filteredShoesList.append(productClothesType[index])
            }
        }
        
        for index in 0..<productClothesName.count{
            if productClothesType[index].contains("garment")
            {
                filteredGarmentList.append(productClothesType[index])
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToSpecificCloth"
        {
            let nav = segue.destination as! UINavigationController
            let destinationViewController = nav.topViewController as! ClothesScrollingViewController
            destinationViewController.identifierForSpecificPage = identifierForSpecificPage
            destinationViewController.productClothesName = productClothesName[identifierForSpecificPage]
            destinationViewController.imageOfProductClothes = productClothesImage[identifierForSpecificPage]
            destinationViewController.nameOfCompany = nameOfCompany[numberOfPage]
            destinationViewController.descriptionOfCompany = descriptionOfCompany
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()}}

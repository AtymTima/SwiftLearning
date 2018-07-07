//
//  RepeatableFunctions.swift
//  Mega
//
//  Created by  Тима on 06.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation
import UIKit

class CollectingViews
{
    func reloadTableWithDelay(objectTable: UITableView)
    {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
            {
                objectTable.reloadData()
            }
    }
    func reloadCollectionWithDelay(objectCollection: UICollectionView)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8)
        {
            objectCollection.reloadData()
        }
    }
}

class Filtering
{
    func showFilteredShoes()
    {
        
        let currentType = ClothesDetailedViewController()
        for i in 0..<currentType.productClothesType.count{
            if currentType.productClothesType[i].contains("shoes")
            {
                currentType.filteredShoesList[i] = currentType.productClothesType[i]
            }
//            currentType.filteredShoesList = currentType.productClothesType.filter {$0.contains("shoes")}
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.6)
        {
            print(currentType.filteredShoesList)
        }
        
    }
    
    func showFilteredGarment()
    {
        let currentType = ClothesDetailedViewController()
        for i in 0..<currentType.productClothesType.count{
            if currentType.productClothesType[i].contains("garment")
            {
                currentType.filteredGarmentList[i] = currentType.productClothesType[i]
            }
//            currentType.filteredGarmentList = currentType.productClothesType.filter {$0.contains("garment")}
        }
    }
    
}



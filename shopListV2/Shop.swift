//
//  Shop.swift
//  SpaceAdventure
//
//  Created by Timur on 26.06.2018.
//  Copyright © 2018 Tim K13V. All rights reserved.
//

import Foundation

class Shop{
    var productList: [Product]
    var foodList: [Product]
    var drinkList: [Product]
    
    init(productList: [Product], foodList: [Product], drinkList: [Product]){
        self.productList = productList
        self.foodList = foodList
        self.drinkList = drinkList
    }
    
    func showList(){
        print("What type of product do you want [all | food | drink]:")
        switch getln(){
        case "food":
            foodListShow()
        case "drink":
            drinkListShow()
        case "all":
            allListShow()
        default:
            allListShow()
    }
    
}
    
    func choose(id: Int) -> Product{
        return productList[id-1]
    }
    
    func allListShow(){
        print(ProductType.all.typeIndex())
        for index in 0..<productList.count{
            let selected = productList[index]
            print("ID \(index+1): \(selected.name) $\(selected.price)")
        }
    }
    
    func foodListShow(){
        print(ProductType.food.typeIndex())
        
        for _ in 0..<productList.count{
            foodList = productList.filter {$0.type.contains("food")}
        }
        for index in 0..<foodList.count{
            let selected = foodList[index]
            print("ID \(index+1): \(selected.name) $\(selected.price)")
        }
    }
    func drinkListShow(){
        print(ProductType.drink.typeIndex())
        
        for _ in 0..<productList.count{
            drinkList = productList.filter {$0.type.contains("drink")}
        }
        for index in 0..<drinkList.count{
            let selected = drinkList[index]
            print("ID \(index+4): \(selected.name) $\(selected.price)")
        }
    }
    

enum ProductType: String {
    case food,drink,all
    func typeIndex() -> String {
        switch self {
        case .food:
            return "There is a list of food"
        case .drink:
            return "There is a list of drinks"
        case .all:
            return "There is a full list of products"
        }
    }
}
}

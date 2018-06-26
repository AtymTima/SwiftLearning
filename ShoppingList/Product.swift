//
//  Product.swift
//  ShoppingList
//
//  Created by  Тима on 26.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation

class Food: Product {
    let color: String
    init (color: String, items: [String: Int], price: Int, type: String){
        self.color = color
        super.init(items: items, price: price, type: type)
    }
}

class Drink: Product {
    let brand: String
    init (brand: String, items: [String: Int], price: Int, type: String){
        self.brand = brand
        super.init(items: items, price: price, type: type)
    }
}

class Cart: Food {
    
}

let FoodProducts = [
    "Tomato $20",
    "Apple $50",
    "Orange $100",
    "Tomato Juice $60",
    "Apple Juice $150",
    "Orange Juice $300"
]


var element: Int = -1

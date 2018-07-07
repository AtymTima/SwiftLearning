//
//  Product.swift
//  Mega
//
//  Created by  Тима on 06.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation

struct ProductClothes
{
    let nameOfProductCloth: [String]
    let priceOfProductCloth: [Int]
    let typeOfProductCloth: [String]
    let logoOfProductCloth: [String]
}

class ProductFood
{
    let nameOfProductFood: [ShopFood]
    let priceOfProductFood: [ShopFood]
    let typeOfProductFood: [ShopFood]
    let logoOfProductFood: [ShopFood]
    
    init(nameOfProductFood: [ShopFood], priceOfProductFood: [ShopFood], typeOfProductFood: [ShopFood], logoOfProductFood: [ShopFood])
    {
        self.nameOfProductFood = nameOfProductFood
        self.priceOfProductFood = priceOfProductFood
        self.typeOfProductFood = typeOfProductFood
        self.logoOfProductFood = logoOfProductFood
    }
}

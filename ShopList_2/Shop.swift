//
//  Shop.swift
//  ShopList2
//
//  Created by  Тима on 27.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation

class Shop{
    var productList: [Product]
    
    init(productList: [Product]){
        self.productList = productList
    }
    
    func showList(){
        for index in 0..<productList.count{
            let currIndex = productList[index]
            print("ID \(index+1): \(currIndex.name) $ \(currIndex.price)")
        }
    }
    
    func choose(id: Int) -> Product{
        return productList[id-1]
    }
}

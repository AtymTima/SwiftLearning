//
//  Cart.swift
//  ShopList2
//
//  Created by  Тима on 27.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation

struct Cart {
    var list: [Product] = []
    
    mutating func add(product: Product){
        list.append(product)
    }
    
    func showList(){
        if !list.isEmpty {
            for (index, currIndex) in list.enumerated() {
                print("ID \(index + 1): \(currIndex.name) $ \(currIndex.price)")
            }
        } else {
            print("Your cart is empty")
        }
    }
    
    mutating func remove(id: Int) {
        if !list.isEmpty && (id>=1 && id<=list.count){
            list.remove(at: id-1)
        }else{
            print("ERROR")
        }
    }
    
    func accept(userBalance: Int) -> (Bool, Int) {
        var sum = 0
    
        
        for product in list {
            sum += product.price
        }
        if (userBalance >= sum){
            return (true, sum)
        } else {
            return (false, sum)
        }
    }
    
    func isEmpty() -> Bool{
        return list.isEmpty
    }
    
    
    
}

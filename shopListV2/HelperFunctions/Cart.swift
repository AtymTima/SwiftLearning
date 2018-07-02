//
//  Cart.swift
//  SpaceAdventure
//
//  Created by Timur on 26.06.2018.
//  Copyright © 2018 Tim K13V. All rights reserved.
//

import Foundation
struct Cart {
    var list: [Product] = []
    var cartList: [Product]
    
    init(cartList: [Product]){
        self.cartList = cartList
    }

    
    
    mutating func add(product: Product){
            if list.count < 5{
                list.append(product)
            }else if list.count >= 5{
                print("Your cart is limited. No more than 5 products")
            }
    }
    
    func showList(){
        if !list.isEmpty {
            for (index, selected) in list.enumerated() {
                
                print("ID \(index + 1): \(selected.name) $\(selected.price)")
            }
        } else {
            print("Your cart is empty")
        }
    }
    
    mutating func remove(id: Int) {
        if !list.isEmpty && (id>=1 || id<=list.count){
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
            if user.cart.list.count == 5 {
                discount = 50
                balance = balance - sum - Int(discount)
            } else {
                balance! -= sum
            }
            
            return (true, sum)
        } else {
            return (false, sum)
        }
    }
    
    func isEmpty() -> Bool{
        return list.isEmpty
    }
    
    
    
}

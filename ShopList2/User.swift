//
//  User.swift
//  ShopList2
//
//  Created by  Тима on 27.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation

class User{
    
    let name: String
    let money: Int
    var cart = Cart()
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func accept() -> (Bool, Int) {
        return cart.accept(userBalance: money)
    }
}

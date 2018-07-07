//
//  User.swift
//  Mega
//
//  Created by  Тима on 06.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation

class User{
    
    var chosenUsername: String
    var chosenBalance: Int
//    var cart = Cart(cartList: list)
    
    init(chosenUsername: String, chosenBalance: Int) {
        self.chosenUsername = chosenUsername
        self.chosenBalance = chosenBalance
    }
    
//    func accept() -> (Bool, Int) {
//        return cart.accept(userBalance: balance)
//    }
    
    
}

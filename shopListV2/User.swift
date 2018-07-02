//
//  User.swift
//  SpaceAdventure
//
//  Created by Timur on 26.06.2018.
//  Copyright © 2018 Tim K13V. All rights reserved.
//

import Foundation


class User{
    
    var name: String
    var balance: Int
    var cart = Cart(cartList: list)
    
    init(name: String, balance: Int) {
        self.name = name
        self.balance = balance
    }

    func accept() -> (Bool, Int) {
        return cart.accept(userBalance: balance)
    }
    
    
}

func newUser(){
    balance = 0
    name = ""
    user.cart.list = []
}

func greeting(){
    while name == ""{
        print("Hello, my name is Tim K13V, your personal assistant. Please enter your name")
        name = getln()
    }
    
    print("Welcome to N13Shop, \(name!) \n How much money do you have?")
    balance = Int(getln())
    
    while (balance! < 50) {
        print("You must have at least 50 dollars")
        balance = Int(getln())
    }
}



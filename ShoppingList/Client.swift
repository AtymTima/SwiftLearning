//
//  Client.swift
//  ShoppingList
//
//  Created by  Тима on 26.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation

class Client: Person {
    let purchases: [String]
    init (cash: Int, name: String, purchases: [String]){
        self.purchases = purchases
        super.init(cash: cash, name: name)
    }
    
    func checkCash() {
        var numCash: String
        while (cash < 50) {
            print("You must have at least 50 dollars")
            numCash = readLine()!
            cash = Int(numCash)!
        }
        request()
    }
    
    override func greeting(){
        print("Welcome to our shop, \(name)! How much money do you have?")
        checkCash()
    }
    
                func request(){
                    var answer = ""
                    if (path == 0){
                    while !(answer == "Products" || answer == "Cash" || answer == "MyCart" || answer == "Checkout") {
                        answer = responseToPrompt("Choose [Products/Cash/MyCart/Checkout]")
                        if answer == "Products" {
                            path += 1
                            request()
                        }
                        if answer == "Cash" {
                            print("You have \(cash) dollars!")
                            request()
                        }
                        if answer == "MyCart" {
                            print(MyCart)
                            request()
                        }
                        if answer == "Checkout" {
                                if (totalPrice < cash){
                                    for purchases in MyCart{
                                        print("You bought \(purchases)")
                                }
                                    
                                    cash -= totalPrice
                                } else {
                                    print("Oops, not enough money")
                                }
                            MyCart = []
                            totalPrice = 0
                            request()
                        }
                    }
                    } else {
                        while !(answer == "Food" || answer == "Drink" || answer == "Return") {
                            answer = responseToPrompt("What do you want to buy? [Food/Drink/Return]")
                            if answer == "Food" {
                                answer = ""
                                while !(answer == "Orange" || answer == "Tomato" || answer == "Apple" || answer == "Return"){
                                    answer = responseToPrompt("Choose from first 3 items: \(FoodProducts) or Return")
                                    if answer == "Orange" {
                                        element = 2
                                        totalPrice += 100
                                            addToCart()
                                    }
                                    if answer == "Tomato" {
                                        element = 0
                                        totalPrice += 20
                                            addToCart()
                                    }
                                    if answer == "Apple" {
                                        element = 1
                                        totalPrice += 50
                                            addToCart()
                                    }
                                    if answer == "Return" {
                                        
                                    }
                                }
                            }
                            if answer == "Drink" {
                                answer = ""
                                while !(answer == "Orange Juice" || answer == "Tomato Juice" || answer == "Apple Juice" || answer == "Return"){
                                    answer = responseToPrompt("Choose from last 3 items: \(FoodProducts) or Return")
                                    if answer == "Orange Juice" {
                                        element = 5
                                        totalPrice += 300
                                            addToCart()
                                    }
                                    if answer == "Tomato Juice" {
                                        element = 3
                                        totalPrice += 60
                                            addToCart()
                                    }
                                    if answer == "Apple Juice" {
                                        element = 4
                                        totalPrice += 150
                                            addToCart()
                                    }
                                    if answer == "Return" {
                                        
                                    }
                                }
                            }
                            if answer == "Return" {
                                path -= 1
                                request()
                            }
                        }
                        path -= 1
                        request()

                    }
                }
    func addToCart(){
        indexes.insert(element, at: 0)
        MyCart = indexes.map{FoodProducts[$0]}
        print(MyCart)

        }
    }


let inputName = responseToPrompt("What is your name?")
var indexes: [Int] = []
var MyCart: [String] = []
var totalPrice: Int = 0

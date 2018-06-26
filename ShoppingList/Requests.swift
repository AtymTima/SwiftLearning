//
//  Requests.swift
//  ShoppingList
//
//  Created by  Тима on 26.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation

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
                
                request()
            }
            if answer == "Checkout" {
                print(purchases)
                
                request()
            }
        }
    } else {
        while !(answer == "Food" || answer == "Drink" || answer == "Return") {
            answer = responseToPrompt("What do you want to buy? [Food/Drink/Return]")
            if answer == "Food" {
                print("Choose from these: \(FoodProducts) or Return")
                while !(answer == "Orange" || answer == "Tomato" || answer == "Apple" || answer == "Return"){
                    if answer == "Orange" {
                        var leftProducts = FoodProducts.filter { $0 != "Orange" }
                        request()
                    }
                }
                //                    path -= 1
                //                    request()
            }
            if answer == "Drink" {
                
                path -= 1
                request()
            }
            if answer == "Return" {
                path -= 1
                request()
            }
        }
    }
}

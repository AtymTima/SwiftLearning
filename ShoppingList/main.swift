//
//  main.swift
//  ShoppingList
//
//  Created by  Тима on 26.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation

func getln() -> String {
    let stdin = FileHandle.standardInput
    var input = NSString(data: stdin.availableData, encoding: String.Encoding.utf8.rawValue)
    input = input!.trimmingCharacters(in: CharacterSet.newlines) as NSString?
    return input! as String
}

func responseToPrompt(_ prompt: String) -> String {
    print(prompt)
    return getln()
}

class Person {
    var cash: Int
    let name: String
    
    init (cash: Int, name: String){
        self.cash = cash
        self.name = name
    }
    func greeting(){
        fatalError("Use that to say hello to \(name)")
    }
}


class Product {
    var items: [String: Int]
    var price: Int
    var type: String
    init (items: [String: Int], price: Int, type: String){
        self.items = items
        self.price = price
        self.type = type
    }
//    func addToCart(value){
//        var myCart = items(value)
//    }
}

//let purchases = MyCart()
let client = Client(cash:0, name: inputName, purchases:[""])
client.greeting()
var path = 0




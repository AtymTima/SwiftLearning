//
//  main.swift
//  ShopList2
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


////class Product {
////    var name: [String]
////    var price: [Int]
//////    let
////    init (name: [String], price: [Int]){
////        self.name = name
////        self.price = price
////    }
////    func checkProd() -> String {
//////        for (name, price) in (products) {
////
////        }
////    }
//////}
//
//class Client {
//    var user: String
//    var cash: Int
//    init (user: String, cash: Int){
//        self.user = user
//        self.cash = cash
//    }
//    func greeting(_ greet: String){
//        print("Welcome, \(greet)!")
//        print(Show())
//    }
//
//    func Show() -> String{
//        return "Choose [Products/Prices/Cash/MyCart/Checkout]"
//    }
//}
//
//class Cart{
//    func add(_ products: Product) -> String {
//        var choice = ""
//
//        while !(choice == "Apple" || choice == "Orange" || choice == "Tomato"){
//            print("Choose from \(products)")
//        }
//        return choice
//    }
//}
//
//class Buy{
//
//}
//
//let fruits = ["Apple", "Orange", "Tomato"]
//let prices = [20, 50, 100]
//let products = Product(name: fruits, price: prices)
//
//let greet = responseToPrompt("How can I call you?")
//let client = Client(user: greet, cash:0)
//client.greeting(greet)

var list: [Product] = [Product(name: "Apple", price: 120), Product(name: "Orange", price: 80), Product(name: " Tomato", price: 40)]

let shop = Shop(productList: list)

print("Hello, my name is Tim K13V, your personal assistant. Please enter your name")
let name = getln()
print("Welcome to N13Shop, \(name)")
print("How much money do you have?")
var money = Int(getln())

while (money! < 50) {
    print("You must have at least 50 dollars")
    money = Int(getln())
}

let user = User(name: name, money: money!)

var tr = true
while(tr){
    print("Choose what do you want to do:[show | choose | cart | remove | checkout]:")
    let action = getln()
    switch action{
    case "show":
        shop.showList()
    case "choose":
        print("Choose product using its id (show to see them):")
        var id = Int(getln())!
        while !(id >= 1 && id <= list.count) {
            print("There is no product with this id: choose from 1 to 3")
            id = Int(getln())!
        }
        user.cart.add(product: shop.choose(id: id))
        
        
    case "checkout":
        user.cart.showList()
        if !user.cart.isEmpty(){
            print("Do you want to buy it?")
            
            if getln().uppercased() == "Y" {
                
                let check = user.accept()
                
                if(check.0){
                            print("You paid $ \(check.1). Good Bye!" )
                    
                    tr = false
                } else {
                    print("Your balance isnt enought")
                }
            }
        }
    case "cart":
        user.cart.showList()
    case "remove":
        print("Choose id")
        user.cart.remove(id: Int(getln())! )
    default:
        print("I don't have that function, try again")
    }
}



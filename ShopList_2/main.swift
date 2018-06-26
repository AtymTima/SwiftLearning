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

var list: [Product] = [Product(name: "Apple", price: 20),
                       Product(name: "Orange", price: 50),
                       Product(name: "Tomato", price: 150)]

let shop = Shop(productList: list)

print("Hello, my name is Tim K13V, your personal assistant. Please enter your name")
let name = getln()
print("Welcome to N13Shop, \(name)")
print("How much money do you have?")
let money = Int(getln())
let user = User(name: name, money: money!)

var tr = true
while(tr){
    print("Choose:[show|cart|choose|remove|checkout]:")
    let action = getln()
    switch action{
    case "show":
        shop.showList()
    case "choose":
        print("Choose product by id:")
        let id = Int(getln())!
        if id >= 1 || id < list.count {
            user.cart.add(product: shop.choose(id: id))
        }else{
            print("there is no product with this id")
        }
        
    case "checkout":
        user.cart.showList()
        if !user.cart.isEmpty(){
            print("Do you wanna buy it?")
            
            if getln().uppercased() == "Y" {
                
                let check = user.accept()
                
            }else {
                print("Isnt enought money")
            }}
                        default:
                            print("Oops, something isn't ok")
                        }
                    }
                    
                    tr = false




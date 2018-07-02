/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import Foundation

var list: [Product] = [Product(name: "Apple", price: 100, type: "food", amount: 2),
                        Product(name: "Orange", price: 125, type: "food", amount: 2),
                        Product(name: "Banana", price: 75, type: "food", amount: 1),
                        Product(name: "Sprite", price: 50, type: "drink", amount: 2),
                       Product(name: "Cola", price: 80, type: "drink", amount: 1),
                       Product(name: "Kumis", price: 200, type: "drink", amount: 4)]

let shop = Shop(productList: list, foodList: list, drinkList: list)

var name: String! = ""
var balance: Int! = 0
var exit: Int! = 1
var discount = 0.0

greeting()

let user = User(name: name, balance: balance!)
var id: Int
var loop = true
while(loop){
    print("Choose what do you want to do:[show|choose|cart|remove|cash|checkout|exit|discount]:")
    let operation = getln()
    switch operation{
    case "cash":
        print("Your current balance is \(String(describing: balance!)) $")
    case "show":
        shop.showList()
    case "choose":
        print("Choose product by id:")
        id = Int(getln())!
        while !(id >= 1 && id <= list.count) {
            print("There is no product with this id: choose from 1 to 6")
            id = Int(getln())!
        }
        for index in 0..<list.count{
            if index == id - 1 {
                if list[index].amount > 0 {
                   user.cart.add(product: shop.choose(id: id))
                    list[index].amount -= 1
                    exit = 0
                } else {
                    print("There is no more \(list[index].name) in the shop")
                }
            }
        }
        

    case "checkout":
        user.cart.showList()
        if !user.cart.isEmpty(){
            print("Do you want to buy it? Right 'Y' if yes")
            
            if getln().uppercased() == "Y" {
                
                let check = user.accept()
                if(check.0){
                    if user.cart.list.count == 5{
                        print("Congratulations, you have a discount for $50!")
                        discount = 50.0
                    } else {
                        discount = 0.0
                    }
                    var bool = true
                    while(bool){
                        print("Choose how do you wanna pay [cash|card|gold]:")
                        switch getln(){
                        case "gold":
                            print(PaymentType.gold.simpleDescription() + " and you pay \(Double(check.1) * 0.01 - discount * 0.5) kg of gold, which is equal to $\(check.1)")
                            bool = false
                            exit = 1
                        case "cash":
                            print(PaymentType.cash.simpleDescription() + " and you pay $\(Double(check.1) - discount)" )
                            bool = false
                            exit = 1
                        case "card":
                            print("Enter your card number")
                            print(" \(PaymentType.card.simpleDescription()) your card number is \(getln()) and discount is \(Double(check.1) * 0.1 + discount). Total price was $\(Double(check.1) - Double(check.1) * 0.1 - discount)")
                            bool = false
                            exit = 1
                        default:
                            print("Oops, something went wrong")
                        }
                    }
                    user.cart.list = []
//                    loop = false
                } else {
                    print("Your balance isnt enought")
                }
            }
        }
    case "cart":
        user.cart.showList()
    case "remove":
        if !user.cart.isEmpty(){
            print("Choose id from 1 to \(user.cart.list.count)")
            let id = Int(getln())!
            for index in 0..<list.count{
                if list[index].name == user.cart.list[id-1].name{
                    list[index].amount += 1
                }
            }
            user.cart.remove(id: id)
            
            print("Product was removed!")
        } else {
            print("There is no product of that ID in your cart. Check it again")
        }
        if user.cart.list.count == 0{
            exit = 1
        }
    case "exit":
        if exit > 0{
            print("Thank you for visiting, bye bye! \n")
            newUser()
            greeting()
        } else {
            print("Return all things back before you leave or buy them")
        }
    case "discount":
        print("If you will buy 5 product, we will give you a discount!")
    default:
        print("I don't have that function, try again")
    }
}









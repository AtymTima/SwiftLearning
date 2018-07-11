//
//  ClothesDetailedVCCollectionViewCell.swift
//  Mega
//
//  Created by  Тима on 05.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit
protocol FoodOrderDelegate {
    func setUp( order: ProductFood)
}

class FoodDetailedVCCollectionViewCell: UICollectionViewCell
{
    var sumOfChosenProducts: Int = 0
    var priceOfAllProducts: Int = 0
    var delegate: FoodOrderDelegate?
    var urlOfImg: String?
    var card = Card()
    
    @IBAction func amountProductPressed(_ sender: UIStepper)
    {
        sumOfChosenProducts = Int(choosingAmountStepper.value)
    }
    @IBOutlet weak var viewOfCell: UIView!
    @IBOutlet weak var choosingAmountStepper: GMStepper!
    @IBOutlet weak var makeAnOrderButton: UIButton!
    @IBOutlet weak var logoOfProductImage: UIImageView!
    @IBOutlet weak var priceOfProductLabel: UILabel!
    @IBOutlet weak var nameOfProductLabel: UILabel!
    @IBAction func makeAnOrderButtonPressed(_ sender: Any)
    {
        let orderGood = ProductFood(nameOfProductFood: nameOfProductLabel.text!, priceOfProductFood: 1, typeOfProductFood: "", logoOfProductFood: urlOfImg)
//        Int(priceOfProductLabel.text!)!
        
//        FoodDetailedViewController().totalSum =  1 * sumOfChosenProducts
        
        card.currentImage = logoOfProductImage.image!
        card.foodCard.append(orderGood)
        delegate?.setUp(order: orderGood)
        choosingAmountStepper.value = 0
        sumOfChosenProducts = 0
    }
    
}

extension FoodDetailedViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDetailedClothes", for: indexPath) as! FoodDetailedVCCollectionViewCell
        let url = URL(string: logoUrl[indexPath.row])
        cell.logoOfProductImage.kf.setImage(with: url)
        cell.nameOfProductLabel.text = name[indexPath.row]
        cell.priceOfProductLabel.text = String("\(pricesOfProducts[indexPath.row]) тг")
        
        roundCornerStyle().makeRoundView(object: cell.viewOfCell)
        roundCornerStyle().makeSmoothCorners(object: cell.makeAnOrderButton)
        
        //        roundCornerStyle().makeRoundView(object: cell.viewForAverageCheck)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        numberOfChosenProduct = indexPath.row
    }
    
//    func checkTheBalanceForOrder()
//    {
//        if pricesOfProducts[numberOfChosenProduct] < balanceOfUser
//        {
//            alert(object: successAnswer)
//        }
//        else if balanceOfUser < pricesOfProducts[numberOfChosenProduct]
//        {
//            alert(object: failureAnswer)
//        }
//        else { print("oops, something went wrong") }
//    }
    
    func alert(object: String)
    {
        let ac = UIAlertController(title: "Dear customer", message: "\(object)", preferredStyle: .alert)
        present(ac, animated: true)
    }
    
}

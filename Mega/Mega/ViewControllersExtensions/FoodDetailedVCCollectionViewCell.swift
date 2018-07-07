//
//  ClothesDetailedVCCollectionViewCell.swift
//  Mega
//
//  Created by  Тима on 05.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit

class FoodDetailedVCCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var viewOfCell: UIView!
    @IBOutlet weak var choosingAmountStepper: GMStepper!
    @IBOutlet weak var makeAnOrderButton: UIButton!
    @IBOutlet weak var logoOfProductImage: UIImageView!
    @IBOutlet weak var priceOfProductLabel: UILabel!
    @IBOutlet weak var nameOfProductLabel: UILabel!

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
    
}

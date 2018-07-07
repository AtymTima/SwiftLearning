//
//  ClothesDetailedVCCollectionViewCell.swift
//  Mega
//
//  Created by  Тима on 06.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit
import Foundation

class ClothesDetailedVCCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var nameOfProductClothes: UILabel!
    @IBOutlet weak var priceOfProductClothes: UILabel!
    @IBOutlet weak var imageOfProductClothes: UIImageView!
    @IBOutlet weak var viewBehindImage: UIView!
}

extension ClothesDetailedViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if currentSegment == 0
        {
            return productClothesName.count
        }
        else if currentSegment == 1
        {
            return filteredShoesList.count
        }
        else if currentSegment == 2
        {
            return filteredGarmentList.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOfDetailedClothes", for: indexPath) as! ClothesDetailedVCCollectionViewCell
        if currentSegment == 0
        {
            let url = URL(string: productClothesImage[indexPath.row])
            cell.imageOfProductClothes.kf.setImage(with: url)
            cell.nameOfProductClothes.text = productClothesName[indexPath.row]
            cell.priceOfProductClothes.text = String("\(productClothesPrice[indexPath.row]) тг")
            roundCornerStyle().makeRoundView(object: cell.viewBehindImage)
        }
        else if currentSegment == 1
        {
            if filteredShoesList[indexPath.row] == "shoes"
            {
                let url = URL(string: productClothesImage[indexPath.row])
                cell.imageOfProductClothes.kf.setImage(with: url)
                cell.nameOfProductClothes.text = productClothesName[indexPath.row]
                cell.priceOfProductClothes.text = String("\(productClothesPrice[indexPath.row]) тг")
                roundCornerStyle().makeRoundView(object: cell.viewBehindImage)
            }
            if filteredShoesList.count == 0
            {
                viewEmptyState.isHidden = false
            } else { viewEmptyState.isHidden = true }
        }
        else if currentSegment == 2
        {
            if filteredGarmentList[indexPath.row] == "garment"
            {
                let url = URL(string: productClothesImage[indexPath.row])
                cell.imageOfProductClothes.kf.setImage(with: url)
                cell.nameOfProductClothes.text = productClothesName[indexPath.row]
                cell.priceOfProductClothes.text = String("\(productClothesPrice[indexPath.row]) тг")
                roundCornerStyle().makeRoundView(object: cell.viewBehindImage)
            }
            if filteredGarmentList.count == 0
            {
                viewEmptyState.isHidden = false
            } else { viewEmptyState.isHidden = true }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        identifierForSpecificPage = indexPath.row
        filteredGarmentList = []
        filteredShoesList = []
        performSegue(withIdentifier: "segueToSpecificCloth", sender: self)
    }

}

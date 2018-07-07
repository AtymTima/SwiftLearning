//
//  ClothesVCCollectionViewCell.swift
//  Mega
//
//  Created by  Тима on 05.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit

class ClothesVCCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var viewClothesCollectionView: UIView!
    @IBOutlet weak var clothesCompanyImage: UIImageView!
}

extension ClothesViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return namesOfCompany.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellForClothes", for: indexPath) as! ClothesVCCollectionViewCell
        let url = URL(string: logosOfCompany[indexPath.row])
        cell.clothesCompanyImage.kf.setImage(with: url)
        //        roundCornerStyle().makeSmoothImageCorners(object: cell.clothesCompanyImage)
        roundCornerStyle().makeRoundView(object: cell.viewClothesCollectionView)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return sizes[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
            numberOfPage = idOfCompanies[indexPath.row]
            performSegue(withIdentifier: "segueToDetailedClothes", sender: self)
        }
}

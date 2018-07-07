//
//  ClothesScrollingCollectionViewCell.swift
//  Mega
//
//  Created by  Тима on 06.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit
import Foundation

class ClothesScrollingCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var vieeBehindImage: UIView!
    @IBOutlet weak var rightArrowScrolling: UIButton!
    @IBOutlet weak var leftArrowScrolling: UIButton!
    @IBOutlet weak var imageScrolling: UIImageView!
}

extension ClothesScrollingViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellScrolling", for: indexPath) as! ClothesScrollingCollectionViewCell
        let url = URL(string: imageOfProductClothes)
        cell.imageScrolling.kf.setImage(with: url)
        return cell
    }
}

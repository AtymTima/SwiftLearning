//
//  BasketVCCollectionViewCell.swift
//  Mega
//
//  Created by  Тима on 11.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit
import Kingfisher

class BasketVCCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var sumOfCard: UILabel!
    @IBOutlet weak var sizeOfCard: UILabel!
    @IBOutlet weak var nameOfCard: UILabel!
    @IBOutlet weak var imageOfCard: UIImageView!
}

extension BasketViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func intoCardInsert(order: ProductFood)  {
        self.card.foodCard.append(order)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return card.foodCard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basketCell", for: indexPath) as! BasketVCCollectionViewCell
        let currentGood = card.foodCard[indexPath.row]
        cell.nameOfCard.text = currentGood.nameOfProductFood
        cell.imageOfCard.kf.setImage(with: URL(string: currentGood.logoOfProductFood!))
        return cell
    }
    
    
}

//
//  StyleAndColors.swift
//  Mega
//
//  Created by  Тима on 04.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar
{
    func changeStyleNavigationBar()
    {
        UINavigationBar.appearance().barTintColor = UIColor.red
    }
}

extension UITabBar
{
    func changeStyleTabBar()
    {
        UITabBar.appearance().tintColor = UIColor.black
    }
}

class roundCornerStyle: UIButton
{
    func makeSmoothCorners(object: UIButton)
    {
        object.layer.cornerRadius = 12
        object.clipsToBounds = true
    }
    
    func makeSmoothImageCorners(object: UIImageView)
    {
        object.layer.cornerRadius = 15
        object.clipsToBounds = true
    }
    
    func makeRoundCorners(object: UIImageView)
    {
        object.layer.cornerRadius = object.frame.size.width / 2
        object.clipsToBounds = true
    }
    
    func makeRoundView(object: UIView)
    {
        object.layer.cornerRadius = 15
        object.clipsToBounds = true
    }
    
}

extension UITextField
{
    func changeTextFieldStyle()
    {
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.5
        self.backgroundColor = UIColor.lightGray
        self.tintColor = UIColor.black
        self.textColor = UIColor.black
        self.alpha = 0.9
    }
}

extension UICollectionView
{
    func changeStyleOfCollectionView(object: UICollectionView)
    {
        let itemSize = UIScreen.main.bounds.width/2 - 5
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize(width: itemSize, height: 250)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        object.collectionViewLayout = layout
        addRefreshControlToCollectionView(object: object)
    }
    @objc func refreshing(refreshControl: UIRefreshControl)
    {
        refreshControl.endRefreshing()
    }
    
    func addRefreshControlToCollectionView(object: UICollectionView)
    {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshing), for: .valueChanged)
        object.refreshControl = refreshControl
        object.addSubview(refreshControl)
    }
}







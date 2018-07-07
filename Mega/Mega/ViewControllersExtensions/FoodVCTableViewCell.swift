//
//  FoodVCTableViewCell.swift
//  Mega
//
//  Created by  Тима on 05.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit

class FoodVCTableViewCell: UITableViewCell {

    
    @IBOutlet weak var contentTouchedCell: UIView!
    @IBOutlet weak var viewForAverageCheck: UIView!
    @IBOutlet weak var logoOfCompanyImage: UIImageView!
    @IBOutlet weak var nameOfCompanyLabel: UILabel!
    @IBOutlet weak var averageCheckLabel: UILabel!
    
    @IBOutlet weak var fullDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)}}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return namesOfCompany.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfFood", for: indexPath) as! FoodVCTableViewCell
        let url = URL(string: logosOfCompany[indexPath.row])
        cell.logoOfCompanyImage.kf.setImage(with: url)
        cell.nameOfCompanyLabel.text = namesOfCompany[indexPath.row]
        cell.fullDescription.text = descriptionsOfCompany[indexPath.row]
        cell.averageCheckLabel.text = String("\(averageChecksOfCompany[indexPath.row]) тг")
        
        roundCornerStyle().makeRoundView(object: cell.viewForAverageCheck)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        indexOfPage = idOfCompanies[indexPath.row]
        performSegue(withIdentifier: "segueToDetailedFood", sender: self)
    }
}

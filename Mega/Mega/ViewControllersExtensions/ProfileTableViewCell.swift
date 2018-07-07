//
//  ProfileTableViewCell.swift
//  Mega
//
//  Created by  Тима on 06.07.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileGivenValue: UILabel!
    @IBOutlet weak var profileCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfProfile", for: indexPath) as! ProfileTableViewCell
        if checkCell == 0
        {
            cell.profileGivenValue.text = "\(chosenUsername)"
            cell.profileCellLabel.text = "Username: "
            checkCell += 1
        } else if checkCell == 1
        {
            
            cell.profileGivenValue.text = "\(chosenCity)"
            cell.profileCellLabel.text = "City: "
            checkCell += 1
        } else if checkCell == 2
        {
            
            cell.profileGivenValue.text = "\(String(chosenBalance))"
            cell.profileCellLabel.text = "Balance: "
            checkCell += 1
        }
        
        return cell
    }
    
    
}

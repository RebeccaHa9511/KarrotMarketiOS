//
//  MyTableViewCell.swift
//  KarrotMarket
//
//  Created by Rebecca Ha on 2022/07/18.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var iconimg: UIImageView!
    @IBOutlet weak var settingsTxt: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}

class MyNeighborhood: UITableViewCell {
    
    @IBOutlet weak var secondSectionIcon: UIImageView!
    @IBOutlet weak var secondSectionLbl: UILabel!
    
}

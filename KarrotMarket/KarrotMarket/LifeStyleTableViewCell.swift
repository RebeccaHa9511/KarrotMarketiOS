//
//  LifeStyleTableViewCell.swift
//  KarrotMarket
//
//  Created by Rebecca Ha on 2022/07/18.
//

import UIKit

class LifeStyleTableViewCell: UITableViewCell {

    @IBOutlet weak var lscategoryLabel: UILabel!
    
    @IBOutlet weak var lsTimelbl: UILabel!
    @IBOutlet weak var lsLocationlbl: UILabel!
    @IBOutlet weak var lsusernamelbl: UILabel!

    @IBOutlet weak var lsDetailslbl: UILabel!
    @IBOutlet weak var lscategoryIconLabel: UILabel!
    @IBOutlet weak var lsImage: UIImageView!
    
    @IBOutlet weak var lsCommentButton: UIButton!
    @IBOutlet weak var lsRespondButton: UIButton!
    
    var lifeStyle: LifeStyle? {
        didSet {
            guard let lifeStyle = lifeStyle else { return }
            lsImage.image = lifeStyle.lifeStyleImg
            lsDetailslbl.text = lifeStyle.lifeStyleDetails
            lsLocationlbl.text = lifeStyle.userLoc
            lscategoryIconLabel.text = lifeStyle.categoryIcon
            lsusernamelbl.text = lifeStyle.userID
            lscategoryLabel.text = lifeStyle.lifeStylecategory
            lsTimelbl.text = lifeStyle.updateTime
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

//
//  RecommendedItemsTableViewCell.swift
//  KarrotMarket
//
//  Created by Rebecca Ha on 2022/07/18.
//

import UIKit

class RecommendsCollectionViewCell: UICollectionViewCell {

    static let identifier = "RecommendsCollectionViewCell"
    

    @IBOutlet weak var recommendsPrice: UILabel!
    @IBOutlet weak var recommendsName: UILabel!
    @IBOutlet weak var recommendsImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setRecommendData(name: String, imageName: UIImage, price: String) {
        
        self.recommendsName.text = name
        self.recommendsImg.image = imageName
        self.recommendsPrice.text = price
    }
    
//    static func nib() -> UINib {
//        return UINib(nibName: "RecommendsCollectionViewCell", bundle: nil)
//    }
    
    
    
}

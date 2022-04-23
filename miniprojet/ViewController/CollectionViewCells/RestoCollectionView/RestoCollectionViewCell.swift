//
//  RestoCollectionViewCell.swift
//  miniprojet
//
//  Created by daly on 10/4/2022.
//

import UIKit

class RestoCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing : RestoCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var RestoImage: UIImageView!
    
    @IBOutlet weak var RestoName: UILabel!
    
    func setup (category: DishResto) {
        RestoName.text = category.name
        RestoImage.kf.setImage(with: category.picture.asUrl)
    }
}

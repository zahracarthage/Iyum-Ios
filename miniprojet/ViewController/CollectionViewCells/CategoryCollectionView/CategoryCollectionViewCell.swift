//
//  CategoryCollectionViewCell.swift
//  miniprojet
//
//  Created by daly on 10/4/2022.
//

import UIKit
import Kingfisher
class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing : CategoryCollectionViewCell.self)
    
    
    @IBOutlet weak var categoryTitleLab: UILabel!
    
    
    func setup (category: String) {
        categoryTitleLab.text = category
        //categoryImageView.kf.setImage(with: category.picture.asUrl)
    }
}


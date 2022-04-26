//
//  RestoCollectionViewCell.swift
//  miniprojet
//
//  Created by daly on 17/4/2022.
//

import UIKit
import Kingfisher

class RestoCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing : RestoCollectionViewCell.self)
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categorieLbl: UILabel!
    
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var imageRes: UIImageView!
    func setup (resto: DishResto) {
        let imgname = "https://firebasestorage.googleapis.com/v0/b/mini-projet-2e934.appspot.com/o/images%2F"+resto.picture!+"?alt=media"
        //let rateS = "\(String(describing: resto.rate))"
        titleLabel.text =  resto.name
        rate.text = resto.rate!  + "⭐️"
        imageRes.kf.setImage(with: imgname.asUrl)
        categorieLbl.text = resto.category?.first
        
    }
}


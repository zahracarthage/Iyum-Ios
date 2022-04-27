

import UIKit

class AllDIshCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: AllDIshCollectionViewCell.self)
    func setup(resto: DishResto) {
        let imgname = "https://firebasestorage.googleapis.com/v0/b/mini-projet-2e934.appspot.com/o/images%2F"+resto.picture!+"?alt=media"
        titleLb.text = resto.name
        rate.text = "5 stars"
        imgRes.kf.setImage(with: imgname.asUrl)
        categoryLb.text = resto.category?.first
    }
    
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var categoryLb: UILabel!
    @IBOutlet weak var imgRes: UIImageView!
    
    @IBOutlet weak var titleLb: UILabel!
}


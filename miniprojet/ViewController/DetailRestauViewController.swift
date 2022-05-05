//
//  DetailRestauViewController.swift
//  miniprojet
//
//  Created by abderrahmen driss on 19/4/2022.
//

import UIKit
import Kingfisher
import StoreKit
class DetailRestauViewController: UIViewController {
    var resto : DishResto?
    var restosAll : [DishResto] = []

    @IBOutlet weak var raitingStack: RatingController!
    override func viewDidLoad() {
        super.viewDidLoad()
        let imgname = "https://firebasestorage.googleapis.com/v0/b/mini-projet-2e934.appspot.com/o/images%2F"+resto!.picture!+"?alt=media"
        titleRes.text = resto!.name
        imgRes.kf.setImage(with: imgname.asUrl)
        descp.text = resto!.about
        Test.id = resto!._id!
                
        
        
    }
    @IBAction func reserve(_ sender: Any) {
      //  print(raitingStack.starsRating)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    /*@IBOutlet weak var nbRate: UIButton!
    @IBAction func rating(_ sender: Any) {
        let alert = UIAlertController(title: "Feedback", message: "Rate This Restaurant", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes It's good", style: .default, handler: { [weak self]_ in
            guard let scene = self?.view.window?.windowScene else{
                print("no scene")
                return
            }
            SKStoreReviewController.requestReview(in: scene)
        }))
        alert.addAction(UIAlertAction(title: "No thanks", style: .default, handler: { _ in
            
        }))
        present(alert, animated: true)
    }
    */
    @IBOutlet weak var titleRes: UILabel!
    @IBOutlet weak var descp: UILabel!
    @IBOutlet weak var imgRes: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


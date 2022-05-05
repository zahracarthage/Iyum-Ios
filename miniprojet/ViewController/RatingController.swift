//
//  RatingController.swift
//  miniprojet
//
//  Created by abderrahmen driss on 25/4/2022.
//

import UIKit

class RatingController: UIStackView {
    var id : String?
    var rate: Int?
    var starsRating = 0
    var restosAll : [DishResto] = []

       var starsEmptyPicName = "star" // change it to your empty star picture name
       var starsFilledPicName = "star.fill" // change it to your filled star picture name
       override func draw(_ rect: CGRect) {
           let starButtons = self.subviews.filter{$0 is UIButton}
           var starTag = 1
           for button in starButtons {
               if let button = button as? UIButton{
                   button.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                   button.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
                   button.tag = starTag
                   starTag = starTag + 1
                   
               }
           }
           Test.num1 = true
          setStarsRating(rating:starsRating)
           
       }
    
       func setStarsRating(rating:Int){
           self.starsRating = rating
           let stackSubViews = self.subviews.filter{$0 is UIButton}
           for subView in stackSubViews {
               if let button = subView as? UIButton{
                   if button.tag > starsRating {
                       button.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                       button.setTitle("☆", for: .normal)
                   }else{
                       button.setImage(UIImage(named: starsFilledPicName), for: .normal)
                       button.setTitle("⭐️", for: .normal)
                   }
               }
           }
           if rating != 0 {
               print(rating)
               RatingViewModel().ratingService(id: Test.id, rate: rating){ [self] success, results in
                   if success {
                       restosAll = []
                       self.restosAll.append(contentsOf: results!)
                   }
               }
           }
           
       }
    
       @objc func pressed(sender: UIButton) {
           setStarsRating(rating: sender.tag)
       }
   }


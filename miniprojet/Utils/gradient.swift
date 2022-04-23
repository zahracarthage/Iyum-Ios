//
//  gradient.swift
//  miniprojet
//
//  Created by Zahra chouchane on 15/4/2022.
//

import Foundation
import UIKit


class GradientButton: UIButton{
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    private lazy var gradientLayer : CAGradientLayer = {
        let l = CAGradientLayer()
               l.frame = self.bounds
        
        //
        l.colors = [Colors.StartingYellow.cgColor, Colors.endingOrange.cgColor]
        
               l.startPoint = CGPoint(x: 0, y: 0.5)
               l.endPoint = CGPoint(x: 1, y: 0.5)
               l.cornerRadius = 23
               layer.insertSublayer(l, at: 0)
        return l
    
    }()
}

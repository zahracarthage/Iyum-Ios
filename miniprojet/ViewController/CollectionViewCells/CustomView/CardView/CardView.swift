//
//  CardView.swift
//  miniprojet
//
//  Created by daly on 11/4/2022.
//

import UIKit

class CardView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSteup()
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
        initialSteup()
    }
    
    private func initialSteup(){
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        
    }
}

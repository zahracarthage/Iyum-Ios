//
//  DishResto.swift
//  miniprojet
//
//  Created by daly on 10/4/2022.
//

import Foundation

struct DishResto  {
    internal init(_id: String? = nil, name: String? = nil, picture: String? = nil, about: String? = nil, category: [String]? = nil, reservation: [String]? = nil, nbplaces: [String]? = nil, menu: [String]? = nil, localisation: [String]? = nil,nbRate: Int? = nil,rate: String? = nil) {
        self._id = _id
        self.name = name
        self.picture = picture
        self.about = about
        self.category = category
        self.reservation = reservation
        self.nbplaces = nbplaces
        self.menu = menu
        self.localisation = localisation
        self.nbRate = nbRate
        self.rate = rate
    }
    var _id,name,picture,about : String? ;
    var category : [String]? ;
    var reservation :[String]? ;
    var nbplaces :[String]? ;
    var menu :[String]?;
    var localisation:[String]?;
    var nbRate : Int?;
    var rate : String?;
    
}


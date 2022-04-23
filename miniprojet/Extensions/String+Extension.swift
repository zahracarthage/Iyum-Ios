//
//  String+Extension.swift
//  miniprojet
//
//  Created by daly on 10/4/2022.
//

import Foundation
extension String {
    var asUrl : URL? {
        return URL(string: self)
    }
}

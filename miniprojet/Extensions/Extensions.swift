//
//  Extensions.swift
//  miniprojet
//
//  Created by Zahra chouchane on 27/4/2022.
//

import Foundation
import UIKit

extension UITextField{
    func showDoneBtnKeyboard()
    {
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(resignFirstResponder))
        
        var toolBarItem = [UIBarButtonItem]()
        toolBarItem.append(flexSpace)
        toolBarItem.append(doneBtn)
        
        let doneToolBar = UIToolbar()
        doneToolBar.items = toolBarItem
        doneToolBar.sizeToFit()
        
        inputAccessoryView = doneToolBar
    }
}

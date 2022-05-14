//
//  verificationRes.swift
//  miniprojet
//
//  Created by Zahra chouchane on 6/5/2022.
//

import UIKit

class verificationRes: UIViewController {

    @IBOutlet weak var successIndication: UILabel!

    
    var message: String?
        
        override func viewDidLoad() {
            if let resultToDisplay = message {
                successIndication.text = resultToDisplay
            } else {
                successIndication.text = "Something went wrong!"
            }
            super.viewDidLoad()
        }

}

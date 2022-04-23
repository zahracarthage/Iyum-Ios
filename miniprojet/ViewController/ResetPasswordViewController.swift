//
//  ResetPassword.swift
//  miniprojet
//
//  Created by Zahra chouchane on 22/4/2022.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var ResetBtn: UIButton!
    @IBOutlet weak var VerifyPasswordTextFiel: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    var UsertokenFromUrl: String!
    var userIdFromUrl: String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        PasswordField.borderStyle = UITextField.BorderStyle.roundedRect
        PasswordField.backgroundColor = Colors.textViewBgcolor;
        
        VerifyPasswordTextFiel.borderStyle = UITextField.BorderStyle.roundedRect
        VerifyPasswordTextFiel.backgroundColor = Colors.textViewBgcolor
        
       
       
    }
    

    @IBAction func ResetPwdBtn(_ sender: Any) {
        
        guard let password = self.PasswordField.text else {return}
        guard let verifyPassword = self.VerifyPasswordTextFiel.text else {return}
        
        if(password != verifyPassword)
        {
            
            let Alert = UIAlertController(title: "Error", message: "Your passwords doesn't match", preferredStyle: .alert)
            Alert.addAction(UIAlertAction(title: "error", style: .default, handler: nil))
            self.present(Alert, animated: true)

        }
        
        else if (password == verifyPassword)
        {
            ApiManager.shareInstance.updatePassword(userId: userIdFromUrl, Token: UsertokenFromUrl, Password: password)
            {
                (result) in
             switch result
             {
             case .success:
                 do {
                 let Alert = UIAlertController(title: "Reset Password", message: "Your Password has been updated Successfully", preferredStyle: .alert)
                 Alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                 self.present(Alert,animated: true)
                     
                     self.performSegue(withIdentifier: "ResetPwdDone",sender: self)

                 }
                     
             case .failure:
                 let Alert = UIAlertController(title: "Error", message: "The link you provided is invalid", preferredStyle: .alert)
                 Alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                 self.present(Alert,animated: true)
            
             }
        }
    
        }
    
    }
    
    
  

}

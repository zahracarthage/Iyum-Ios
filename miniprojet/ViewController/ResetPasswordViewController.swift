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
       
       initialSetup()
       
    }
    
    func initialSetup()
    {
        
        PasswordField.borderStyle = UITextField.BorderStyle.roundedRect
        PasswordField.backgroundColor = Colors.textViewBgcolor;
        
        VerifyPasswordTextFiel.borderStyle = UITextField.BorderStyle.roundedRect
        VerifyPasswordTextFiel.backgroundColor = Colors.textViewBgcolor
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    @objc private func hideKeyBoard()
    {
        self.view.endEditing(true)
    }
    
    
    @objc private func KeyboardWillShow(notification : NSNotification)
    {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
            NSValue {
            if self.view.frame.origin.y == 0 {
                    let keyboardHeight = keyboardFrame.cgRectValue.height
                    let bottomspace = self.view.frame.height - (ResetBtn.frame.origin.y + ResetBtn.frame.height)

                    self.view.frame.origin.y -= keyboardHeight - bottomspace + 10

                     //  self.view.frame.origin.y -= keyboardSize.height
                   }
            
            
        }
     
    }
    
    @objc private func keyboardwillHide(notification : NSNotification)
    {
        if self.view.frame.origin.y != 0
        {
            self.view.frame.origin.y = 0
        }

    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
  
    
    private func tagBasedTextField(_ textField: UITextField) {
        let nextTextFieldTag = textField.tag + 1

        if let nextTextField = textField.superview?.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tagBasedTextField(textField)
        return true
    }

    
    
  

}

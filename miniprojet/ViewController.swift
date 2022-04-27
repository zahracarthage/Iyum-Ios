//
//  ViewController.swift
//  miniprojet
//
//  Created by iMac on 6/4/2022.
//

import UIKit
import Alamofire
import KeychainAccess

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pwdTextfield: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!

    
    @IBOutlet weak var LogInBtn: GradientButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            InitialSetup()
   
        
    }
    
    
    func InitialSetup()
    {
        EmailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        EmailTextField.backgroundColor = Colors.textViewBgcolor;
            
        pwdTextfield.borderStyle = UITextField.BorderStyle.roundedRect
        pwdTextfield.backgroundColor = Colors.textViewBgcolor
        
        self.EmailTextField.tag = 1
        self.pwdTextfield.tag = 2
        
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

    @IBAction func goForgotpwd(_ sender: Any) {
        self.performSegue(withIdentifier: "mSegueForgot", sender: sender)
    }
    @IBAction func GoSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "mSgueSignUp", sender: sender)
    }
    
    
   
    @IBAction func NavigateToMainPage(_ sender: Any) {
        guard let email = self.EmailTextField.text else {return}
        guard let password = self.pwdTextfield.text else {return}
       // let token: String  = ""
        
        
        let user = UserModel(email: email, password: password)
        
        ApiManager.shareInstance.callingLoginApi(Login: user)
        {
           (result) in
            switch result
            {
            case .success:
                do {
              
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let AccueilView = storyBoard.instantiateViewController(withIdentifier: "MainTabBar") as! UITabBarController
                    AccueilView.modalPresentationStyle = .fullScreen
                    self.present(AccueilView, animated:true, completion:nil)
                    
                    let keychain = Keychain(service: "esprit.tn.miniprojetIyum")
                    keychain["Email"] = email
                  

                }
                
            case .failure:
                
               let Alert = UIAlertController(title: "Login", message: "check credentials", preferredStyle: .alert)
                Alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(Alert,animated: true)
           
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
                    let bottomspace = self.view.frame.height - (LogInBtn.frame.origin.y + LogInBtn.frame.height)

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
    


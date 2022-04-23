//
//  ViewController.swift
//  miniprojet
//
//  Created by iMac on 6/4/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pwdTextfield: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    EmailTextField.borderStyle = UITextField.BorderStyle.roundedRect
    EmailTextField.backgroundColor = Colors.textViewBgcolor;
        
    pwdTextfield.borderStyle = UITextField.BorderStyle.roundedRect
    pwdTextfield.backgroundColor = Colors.textViewBgcolor
        
        
        
    }

    @IBAction func goForgotpwd(_ sender: Any) {
        self.performSegue(withIdentifier: "mSegueForgot", sender: sender)
    }
    @IBAction func GoSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "mSgueSignUp", sender: sender)
    }
    
    
   
    @IBAction func NavigateToMainPage(_ sender: Any) {
        guard let username = self.EmailTextField.text else {return}
        guard let password = self.pwdTextfield.text else {return}
       // let token: String  = ""
        
        
        let user = UserModel(username: username, password: password)
        
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
                  

                }
                
            case .failure:
                
               let Alert = UIAlertController(title: "Login", message: "check credentials", preferredStyle: .alert)
                Alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(Alert,animated: true)
           
            }
        }
        
    }
    
    
    
}


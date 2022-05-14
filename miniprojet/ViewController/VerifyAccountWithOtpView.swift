//
//  VerifyAccountWithOtpView.swift
//  miniprojet
//
//  Created by Zahra chouchane on 5/5/2022.
//

import UIKit
import KeychainAccess

class VerifyAccountWithOtpView: UIViewController {
    
    let keychain = Keychain(service: "esprit.tn.miniprojetIyum")

    @IBOutlet weak var codefield: UITextField!
    @IBOutlet weak var errorField: UILabel!
    
    @IBOutlet weak var numberField5: UITextField!
    @IBOutlet weak var numberField6: UITextField!
    @IBOutlet weak var numberField4: UITextField!
    @IBOutlet weak var numberField3: UITextField!
    @IBOutlet weak var numberField2: UITextField!
    @IBOutlet weak var numberField1: UITextField!
    var resultMessage: String?

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
            initialSetup()
            
            }
    func initialSetup()
    {
        
        let email = keychain["Email"]
       ApiManager.shareInstance.sendOtp(email: email!)
        
    }
    
    
    @IBAction func VerifyButton(_ sender: Any) {
        
        print("aa")
        var result: Bool?
        guard let email = keychain["Email"] else {return}
        print("here email is : " + email)
        let codeEn = "\(numberField1.text!)\(numberField2.text!)\(numberField3.text!)\(numberField4.text!)\(numberField5.text!)\(numberField6.text!)"
    
        print(codeEn)
        
        self.errorField.text = nil // reset
        
        ApiManager.shareInstance.verifyOtp(otp: codeEn)
        {
            (result) in
             switch result
             {
                 
             case .success:
                 
                     do
                    { ApiManager.shareInstance.verifyUser(email: email)
                     {
                             (res) in
                          switch res
                          {
                          case .success:
                              do {
                              let Alert = UIAlertController(title: "Verification", message: "Your Account has been verified Successfully", preferredStyle: .alert)
                              Alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                              self.present(Alert,animated: true)
                                  
                                  self.errorField.text = "the code you provided is correct, your account is verified"
                                  
                              }
                                  
                          case .failure:
                              let Alert = UIAlertController(title: "Error", message: "Account could not be verified please try again", preferredStyle: .alert)
                              Alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                              self.present(Alert,animated: true)
                         
                          }
                         
                     }
                  }
                       
             case .failure:
                 
                 let Alert = UIAlertController(title: "Error", message: "The number you provided is invalid", preferredStyle: .alert)
                 Alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                 self.present(Alert,animated: true)
                 
                 self.errorField.text = "the code you provided is incorrect"
                 
             }
        
        }
       
      
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "ResultSegue",
               let dest = segue.destination as? verificationRes {
               dest.message = resultMessage
           }
       }
  
        
        
    
    
    
      
  

}

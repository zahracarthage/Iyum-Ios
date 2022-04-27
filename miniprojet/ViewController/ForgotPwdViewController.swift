//
//  ForgotPwdViewController.swift
//  miniprojet
//
//  Created by PetPals on 4/7/22.
//

import UIKit

class ForgotPwdViewController: UIViewController {

    @IBOutlet weak var SendEmailBtn: UIButton!
    @IBOutlet weak var EmailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSetup()
            

        // Do any additional setup after loading the view.
    }
    
    func initSetup()
    {
        EmailField.borderStyle = UITextField.BorderStyle.roundedRect
        EmailField.backgroundColor = Colors.textViewBgcolor;
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func sendForgotPwdLink(_ sender: Any) {
        
        guard let email = self.EmailField.text else {return}
        
        ApiManager.shareInstance.callingForgotPasswordApi(email: email)
        {
    
        (result) in
         switch result
         {
         case .success:
             do {
             let Alert = UIAlertController(title: "Reset Password", message: "Your Email has been sent successfully", preferredStyle: .alert)
             Alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
             self.present(Alert,animated: true)

               //  self.performSegue(withIdentifier: "AccueilSegue", sender: sender)
             }
                 
         case .failure:
             
             let Alert = UIAlertController(title: "Reset Password", message: "This Email doesn't exist", preferredStyle: .alert)
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
                    let bottomspace = self.view.frame.height - (SendEmailBtn.frame.origin.y + SendEmailBtn.frame.height)

                    self.view.frame.origin.y -= keyboardHeight - bottomspace + 15

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
    
  
    
    
}

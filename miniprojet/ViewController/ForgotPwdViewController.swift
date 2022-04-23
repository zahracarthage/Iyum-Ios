//
//  ForgotPwdViewController.swift
//  miniprojet
//
//  Created by PetPals on 4/7/22.
//

import UIKit

class ForgotPwdViewController: UIViewController {

    @IBOutlet weak var EmailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EmailField.borderStyle = UITextField.BorderStyle.roundedRect
        EmailField.backgroundColor = Colors.textViewBgcolor;
            

        // Do any additional setup after loading the view.
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
}

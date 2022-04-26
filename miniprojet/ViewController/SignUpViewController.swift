//
//  SignUpViewController.swift
//  miniprojet
//
//  Created by daly on 7/4/2022.
//
import AuthenticationServices
import UIKit


class SignUpViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    


    @IBOutlet weak var VerifyPasswordTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var EmailTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

         EmailTextfield.borderStyle = UITextField.BorderStyle.roundedRect
        EmailTextfield.backgroundColor = Colors.textViewBgcolor;
        
        UsernameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        UsernameTextField.backgroundColor = Colors.textViewBgcolor;
        
        PasswordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        PasswordTextField.backgroundColor = Colors.textViewBgcolor;
        VerifyPasswordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        VerifyPasswordTextField.backgroundColor = Colors.textViewBgcolor;
        
        
       LoginApple()

        
      

    }
    
    func LoginApple()
    {
        let LoginApplebutton = ASAuthorizationAppleIDButton(
                authorizationButtonType: .signIn,
                authorizationButtonStyle: .white
            )
        LoginApplebutton.cornerRadius = 23
        
        LoginApplebutton.frame = CGRect(x: 31, y: 655, width: 366, height: 57)

       // LoginApplebutton.center = self.view.center

        
       view.addSubview(LoginApplebutton)
        LoginApplebutton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)

    }
  
    
    
    @IBAction func SignUp(_ sender: Any) {
        guard let username = self.UsernameTextField.text else {return}
        guard let email = self.EmailTextfield.text else {return}
        guard let password = self.PasswordTextField.text else {return}
        guard let verifyPassword = self.VerifyPasswordTextField.text else {return}
    
        if(password == verifyPassword)
        {
            let user = UserModel(username: username, password: password, email: email)
            ApiManager.shareInstance.callingRegisterApi(register: user)
        }
        else {
            let Alert = UIAlertController(title: " Password", message: "check your password", preferredStyle: .alert)
            Alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(Alert,animated: true)
        }
      
    }
    
    @IBAction func SignIn(_ sender: Any) {
        self.performSegue(withIdentifier: "mSegueLoginScreen", sender: sender)
    }
    
    
    @objc
    func handleAuthorizationAppleIDButtonPress() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
             request.requestedScopes = [.fullName, .email]
             
             let controller = ASAuthorizationController(authorizationRequests: [request])
             
             controller.delegate = self
             controller.presentationContextProvider = self
             
             controller.performRequests()
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!

    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {

           if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {

               // Create an account as per your requirement

               let appleId = appleIDCredential.user

               let appleUserFirstName = appleIDCredential.fullName?.givenName

               let appleUserLastName = appleIDCredential.fullName?.familyName

               let appleUserEmail = appleIDCredential.email
               //Write your code

           } else if let passwordCredential = authorization.credential as? ASPasswordCredential {

               let appleUsername = passwordCredential.user

               let applePassword = passwordCredential.password

               //Write your code

           }

       }

   
    
}

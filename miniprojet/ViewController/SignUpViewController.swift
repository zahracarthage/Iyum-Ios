//
//  SignUpViewController.swift
//  miniprojet
//
//  Created by daly on 7/4/2022.
//
import AuthenticationServices
import UIKit


class SignUpViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    


    @IBOutlet weak var SignUpbtn: GradientButton!
    @IBOutlet weak var VerifyPasswordTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var EmailTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        LoginApple()

    }
    
    func initialSetup()
    {
        
        EmailTextfield.borderStyle = UITextField.BorderStyle.roundedRect
       EmailTextfield.backgroundColor = Colors.textViewBgcolor;
       
       UsernameTextField.borderStyle = UITextField.BorderStyle.roundedRect
       UsernameTextField.backgroundColor = Colors.textViewBgcolor;
       
       PasswordTextField.borderStyle = UITextField.BorderStyle.roundedRect
       PasswordTextField.backgroundColor = Colors.textViewBgcolor;
       VerifyPasswordTextField.borderStyle = UITextField.BorderStyle.roundedRect
       VerifyPasswordTextField.backgroundColor = Colors.textViewBgcolor;
        
       self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard)))
        
       NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func LoginApple()
    {
        let LoginApplebutton = ASAuthorizationAppleIDButton(
                authorizationButtonType: .signIn,
                authorizationButtonStyle: .white
            )
        LoginApplebutton.cornerRadius = 23
        
       // LoginApplebutton.frame = CGRect(width: 360, height: 50)
       // LoginApplebutton.frame.size.width = 360
       // LoginApplebutton.frame.size.height = 50
        LoginApplebutton.frame = CGRect(x: 31, y: 680, width: 380, height: 50)
        
        LoginApplebutton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)

        view.addSubview(LoginApplebutton)

        NSLayoutConstraint.activate([
            LoginApplebutton.widthAnchor.constraint(equalToConstant: 370),
            LoginApplebutton.heightAnchor.constraint(equalToConstant: 50),
           // LoginApplebutton.topAnchor(view.)
            LoginApplebutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 31.0),
            LoginApplebutton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 29.0),
           // LoginApplebutton.topAnchor.constraint(equalTo: view.)
            //LoginApplebutton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70.0),

            //LoginApplebutton.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>)
            
            ])

        

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
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("authorization error")
        guard let error = error as? ASAuthorizationError else {
            return
        }

        switch error.code {
        case .canceled:
            // user press "cancel" during the login prompt
            print("Canceled")
        case .unknown:
            // user didn't login their Apple ID on the device
            print("Unknown")
        case .invalidResponse:
            // invalid response received from the login
            print("Invalid Respone")
        case .notHandled:
            // authorization request not handled, maybe internet failure during login
            print("Not handled")
        case .failed:
            // authorization failed
            print("Failed")
        case .notInteractive:
            print("not interactive")

        @unknown default:
            print("Default")
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
                    let bottomspace = self.view.frame.height - (SignUpbtn.frame.origin.y + SignUpbtn.frame.height)

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
    


   
    
}

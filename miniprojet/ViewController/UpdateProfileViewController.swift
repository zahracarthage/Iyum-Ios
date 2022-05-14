//
//  UpdateProfileViewController.swift
//  miniprojet
//
//  Created by Zahra chouchane on 30/4/2022.
//

import UIKit
import KeychainAccess

class UpdateProfileViewController: UIViewController{

    
    let keychain = Keychain(service: "esprit.tn.miniprojetIyum")

    @IBOutlet weak var PhoneNumberField: HSUnderLineTextField!
    @IBOutlet weak var EmailTextField: HSUnderLineTextField!
    @IBOutlet weak var UserNameField: HSUnderLineTextField!
    
    @IBOutlet weak var userImg: UIImageView!
    var imageName : String = ""
    
    @IBOutlet weak var uploadImg: UIButton!
    
    @IBAction func uploadimg(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InitSetup()

    }
    
    

    func InitSetup(){
       
        let email = keychain["Email"]
        ApiManager.shareInstance.getDetailsFromKey(email: email!) {
            
            [self] success, results in
                if success {
                    
                    EmailTextField.attributedPlaceholder = NSAttributedString(
                        string: results.self.email!,
                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
                    )
                    
                    UserNameField.attributedPlaceholder = NSAttributedString(
                        string: results.self.username!,
                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
                    )
                    

                    
            
                    PhoneNumberField.attributedPlaceholder =
                    NSAttributedString(
                        string: results.self.phoneNumber!,
                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
                    )
                  
                    
                  
                    
                    if results.self.picture == "No Picture"
                        {
                        userImg.image = imageWith(name: results.self.username)
                        }
                    
                }
        }
        
        
    }
    
    
    func imageWith(name: String?) -> UIImage? {
       let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
       let nameLabel = UILabel(frame: frame)
       nameLabel.textAlignment = .center
       nameLabel.backgroundColor = .lightGray
       nameLabel.textColor = .white
       nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
       var initials = ""
       if let initialsArray = name?.components(separatedBy: " ") {
           if let firstWord = initialsArray.first {
               if let firstLetter = firstWord.first {
                   initials += String(firstLetter).capitalized }
           }
           if initialsArray.count > 1, let lastWord = initialsArray.last {
               if let lastLetter = lastWord.first { initials += String(lastLetter).capitalized
               }
           }
       } else {
           return nil
       }
       nameLabel.text = initials
       UIGraphicsBeginImageContext(frame.size)
       if let currentContext = UIGraphicsGetCurrentContext() {
           nameLabel.layer.render(in: currentContext)
           let nameImage = UIGraphicsGetImageFromCurrentImageContext()
           return nameImage
       }
       return nil
    }
    
   
    @IBAction func updateProfileBtn(_ sender: Any) {
        guard let email = keychain["Email"] else {return}
       
        var usernameInput: String = ""
        var newEmail : String = ""
        var Phonenumber : String = ""
     
        usernameInput = reurnRightInput(textField: UserNameField)
        newEmail = reurnRightInput(textField: EmailTextField)
        Phonenumber = reurnRightInput(textField: PhoneNumberField)
     
    
        ApiManager.shareInstance.updateUser(email: email, username: usernameInput, phoneNumber:Phonenumber)
        {
            (result) in
             switch result
             {
             case .success:
                 do {
                    let Alert = UIAlertController(title: "Profile Update", message: "Your profile has been updated correctly", preferredStyle: .alert)
                     Alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                     self.present(Alert,animated: true)
                   
                 }
                 
             case .failure:
                 
                let Alert = UIAlertController(title: "Profile Update", message: "There has been an issue please try again", preferredStyle: .alert)
                 Alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                 self.present(Alert,animated: true)
            
             }
         }
          
     
        }
    
    func reurnRightInput(textField : UITextField) -> String
    {
        if (textField.text == "")
        {
            return textField.placeholder!
        }
        else
        {
            return textField.text!
        }
    }
    
}

extension UpdateProfileViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
       if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            userImg.image = image
           //print(image.value(forKey: filename))
          

        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
   
}

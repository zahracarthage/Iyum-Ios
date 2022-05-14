//
//  ProfileViewController.swift
//  miniprojet
//
//  Created by Zahra chouchane on 26/4/2022.
//

import UIKit
import KeychainAccess
import SwiftyJSON
import KeychainAccess


class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let keychain = Keychain(service: "esprit.tn.miniprojetIyum")

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    
    var user :UserModel?


    var TableNames = ["Profile", "Settings", "Notifications", "Log Out"]

    
    @IBOutlet weak var TableDrawer: UITableView!

    
    
    
    override func viewDidLoad() {
        //userImg.image.

        userImg?.layer.cornerRadius = (userImg?.frame.size.width ?? 0.0) / 2
        userImg?.clipsToBounds = true
        userImg?.layer.borderWidth = 3.0
        userImg?.layer.borderColor = UIColor.white.cgColor
     

        getDetails()
        
        self.TableDrawer.backgroundColor = .clear

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell")
        let contentView = cell?.contentView
        let label = contentView?.viewWithTag(1) as! UILabel
        let Image = contentView?.viewWithTag(2) as! UIImageView
        
        label.text = TableNames[indexPath.row]
        Image.image = UIImage(named: TableNames[indexPath.row])
        
        cell?.backgroundColor = .clear
        
        return cell!
        
    }
    
  
    
    func getDetails(){
        let email = keychain["Email"]
        ApiManager.shareInstance.getDetailsFromKey(email: email!) {
            
            [self] success, results in
                if success {
                    
                    //print(results.self)
                   // user = results.self
                    
                    userEmail.text = results.self.email
                    userName.text = results.self.username
                    
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
    
  

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         
         if (indexPath.row == 0)
         {
             print("cell 0")
             performSegue(withIdentifier: "updateProfile", sender: nil)

         }
         if (indexPath.row == 1)
         {
             print("cell 1")
         }
         if (indexPath.row == 2)
         {
             print("cell 2")
         }
         else if (indexPath.row == 3)
         {
             do {
                 
                 try keychain.remove("Email")
                 print("deleted")
                 
                
                 
                 let storyboard = UIStoryboard(name: "Main", bundle: nil)
                     let MainVue = storyboard.instantiateViewController(withIdentifier: "ViewController")
                 MainVue.modalPresentationStyle = .overFullScreen
                 self.present(MainVue, animated: true){
                 self.view.removeFromSuperview()
                 }

                  
             } catch let error {
                 print("error: \(error)")
             }
         }
         
         
    }



    

}

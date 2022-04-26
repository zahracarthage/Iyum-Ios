//
//  ProfileViewController.swift
//  miniprojet
//
//  Created by Zahra chouchane on 26/4/2022.
//

import UIKit
import KeychainAccess
import SwiftyJSON

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    
    var user :UserModel?


    let keychain = Keychain(service: "esprit.tn.miniprojetIyum")
    var TableNames = ["Profile", "Settings", "Notifications","Around me", "Log Out"]
    
    @IBOutlet weak var TableDrawer: UITableView!
    
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
    
  
    override func viewDidLoad() {

        getDetails()
        
        self.TableDrawer.backgroundColor = .clear
       // self.userImg?.layer.cornerRadius = userImg.frame.size.width / 2
      //  self.userImg?.clipsToBounds = true
        //self.userImg?.layer.borderWidth = 1
      //  self.userImg?.layer.borderColor = UIColor.white.cgColor

    }
    
    func getDetails(){
        let email = keychain["Email"]
        ApiManager.shareInstance.getDetailsFromKey(email: email!) {
            
            [self] success, results in
                if success {
                    
                    print(results.self)
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


    

}

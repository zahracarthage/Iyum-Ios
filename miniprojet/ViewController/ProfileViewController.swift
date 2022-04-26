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
    
    
    
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    
  /*  var completionHandler: ([user]) -> Void = { (user) in
    print("Here are the \(patients)")
    }*/

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

        let email = keychain["Email"]
        ApiManager.shareInstance.getDetailsFromKey(email: email!) {
            (response) in
            switch response
             {
             case .success :
                 do {
                    // userEmail.text == ResponseModel.username 

                 }
                 
             case .failure:
                    print("ntohing to do, this is always true")
            
             }
        }
        
        self.TableDrawer.backgroundColor = .clear
        self.userImg?.layer.cornerRadius = (userImg?.frame.size.width ?? 0.0) / 2
        
        self.userImg?.clipsToBounds = true
        self.userImg?.layer.borderWidth = 3.0
        self.userImg?.layer.borderColor = UIColor.white.cgColor
        

    }
    

   

}

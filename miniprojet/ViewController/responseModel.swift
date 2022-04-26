//
//  User.swift
//  miniprojet
//
//  Created by Zahra chouchane on 15/4/2022.
//

import Foundation

struct ResponseModel :Codable{
    
    var username: String
    var password : String?
    var picture: String
    var email: String
    var followers = [String]()
    var following = [String]()
    var posts = [String]()
    //var token : String?
    
    
    enum CodingKeys: String, CodingKey {
          case email
          case username
          case picture
      }

    
  /*   init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(String.self, forKey: .email)
        self.username = try container.decode(String.self, forKey: .username)
        self.picture = try container.decode(String.self, forKey: .picture)
    }*/
  
    
    
  
    

    
}


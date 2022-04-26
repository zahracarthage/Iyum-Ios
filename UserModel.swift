//
//  User.swift
//  miniprojet
//
//  Created by Zahra chouchane on 15/4/2022.
//

import Foundation

struct UserModel :Codable{
    
    var username: String?
    var password : String?
    var picture: String?
    var email: String?
    var followers = [String]()
    var following = [String]()
    var posts = [String]()
    //var token : String?
    
    
    

    
    
    init(username: String, password: String, picture: String, email:String, _ followers: [String],_ following: [String],_ posts: [String])
    {
        self.username = username
        self.password = password
        self.picture = picture
        self.email = email
        self.followers = followers
        self.following = following
        self.posts = posts
    }
    
    init (username:String, password: String, email: String)
    {
        self.username = username
        self.password = password
        self.email = email
    }
    
    init (username: String, password: String)
    {
        self.username = username
        self.password = password
       // self.token = token
    }
    init(username: String, email: String)
    {
        self.username = username
        self.email = email
    }
    init(email: String, password: String)
    {
        self.email = email
        self.password =  password
    }
   
    

    
}

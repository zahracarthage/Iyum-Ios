//
//  ApiManager.swift
//  miniprojet
//
//  Created by Zahra chouchane on 16/4/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

enum APIErrors: Error{
    case custom(message : String)
}

//

typealias Handler = (Swift.Result<Any?, APIErrors>)-> Void


class ApiManager{
    static let shareInstance = ApiManager()
    

    func getDetailsFromKey(email: String, completionHandler : @escaping /*([ResponseModel])-> Void*/ Handler)
    {
        var request = URLRequest(url: URL(string: GetDetailsUrl)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let dictParam: [String: String] = ["email": email]

        let body = try! encoder.encode(dictParam)
        
        request.httpBody = body
        
     
        AF.request(request).response
        {
            response in
            switch response.result{
            case .success(let data):
               do {
                   let json = try JSONSerialization.jsonObject(with: data!, options: [])
                 
        

                 //  let parseJson = json
                   if response.response?.statusCode == 201{
                       
                       let jsonres = JSON(data! as Any)
                        print(data)
                        let user = jsonres["FoundUser"]
                      // completionHandler(user.rawValue)
                   //    completionHandler(user.rawValue)
                    //   completionHandler(.success(" successfully"))
                       //completionHandler(user.rawValue as! [ResponseModel])
                    
                   }
                   
                   else {
                       print("user not found")
                      // completionHandler(.failure(.custom(message: "Please the credentials you entered")))

                   }
                
               }catch{
                   print(error)
                 //  completionHandler(.failure(.custom(message: "Please try again")))

               }
            case .failure(let err) :
                print(err.localizedDescription)
                
            }
        }
    }

    func updatePassword(userId: String, Token: String, Password: String,completionHandler : @escaping Handler )
    {
       
        let Url =  "http://localhost:4001/user/\(userId)/\(Token)"
        
        var request = URLRequest(url: URL(string: Url)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let dictParam: [String: String] = ["password": Password]

        let body = try! encoder.encode(dictParam)
        
        request.httpBody = body

        
        AF.request(request).response
        {
            response in debugPrint(response)
            
            switch response.result {
        case .success:
            do {
                
                if response.response?.statusCode == 200{
                    completionHandler(.success("Your Password has been updated successfully"))
                }
                else {
                    completionHandler(.failure(.custom(message: "Please the credentials you entered")))
                }
             
            }
                catch{
                print(error.localizedDescription)
                completionHandler(.failure(.custom(message: "Please try again")))
                
            }
         case .failure(let err) :
             print(err.localizedDescription)
             
         }
        }
        }
    
    
    
    
    func callingForgotPasswordApi(email: String,completionHandler : @escaping Handler)
    {
        
        var request = URLRequest(url: URL(string: forgotPasswordUrl)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let dictParam: [String: String] = ["email": email]

        let body = try! encoder.encode(dictParam)
        
        request.httpBody = body

        AF.request(request).response
        { response in
            switch response.result{
            case .success:
               do {
                   
                   if response.response?.statusCode == 200{
                       completionHandler(.success("Your Reset Link has been sent successfully, please Check your email"))
                   }
                   else {
                       completionHandler(.failure(.custom(message: "Please recheck your credentials")))
                   }
                
               }catch{
                   print(error.localizedDescription)
                   completionHandler(.failure(.custom(message: "Please try again")))
                   
               }
            case .failure(let err) :
                print(err.localizedDescription)
                
            }
               
            }
        
    }
    
    
    func callingRegisterApi(register: UserModel)
    {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(registerUrl, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers ).response {
            response in debugPrint(response)
            
            switch response.result{
            case .success(let data):
               do {
                   let json = try JSONSerialization.jsonObject(with: data!, options: [])
                   
               }catch{
                   
                   
               }
            case .failure(let err) :
                print(err.localizedDescription)
            }
        }
    }
    
    
    
    func callingLoginApi(Login: UserModel, completionHandler : @escaping Handler)
    {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(LoginUrl, method: .post, parameters: Login, encoder: JSONParameterEncoder.default, headers: headers ).response{
            response in debugPrint(response)
            
            switch response.result{
            case .success(let data):
               do {
                   let json = try JSONSerialization.jsonObject(with: data!, options: [])
                   print(json)
                   if response.response?.statusCode == 200{
                       completionHandler(.success(json))
                   }
                   else {
                       completionHandler(.failure(.custom(message: "Please recheck your credentials")))
                   }
                
               }catch{
                   print(error.localizedDescription)
                   completionHandler(.failure(.custom(message: "Please try again")))
                   
               }
            case .failure(let err) :
                print(err.localizedDescription)
                
            }
        }
    }

}





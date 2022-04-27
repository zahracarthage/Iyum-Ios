//
//  AccueilViewModel.swift
//  miniprojet
//
//  Created by daly on 18/4/2022.
//

import Foundation
import SwiftyJSON
import Alamofire
 class AccueilViewModel{
    
    static let sharedInstance = AccueilViewModel()
    
    func findAllResto(  completed: @escaping (Bool, [DishResto]?) -> Void ) {
            AF.request(Resto_URL + "findAllResto",
                       method: .get)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseData { response in
                    switch response.result {
                    case .success:
                        let jsonData = JSON(response.data!)
                        var restos : [DishResto]? = []
                        for singleJsonItem in jsonData["restos"]  {
                            restos!.append(self.makeItem(jsonItem: singleJsonItem.1))
                        }
                        completed(true, restos)
                    case let .failure(error):
                        debugPrint(error)
                        completed(false, nil)
                    }
                }
        }
    func makeItem(jsonItem: JSON) -> DishResto {
        
        var BParray : [String] = []
        for singleJsonItem in jsonItem["category"]   {
            BParray.append(singleJsonItem.1.stringValue)
        }
        
        
        var BUarray : [String] = []
        for singleJsonItem in  jsonItem["reservation"]  {
            BUarray.append(singleJsonItem.1.stringValue)
        }
        
        var BCarray: [String] = []
        for singleJsonItem in  jsonItem["nbplaces"]  {
            BCarray.append(singleJsonItem.1.stringValue)
        }
        
        var BDarray: [String] = []
        for singleJsonItem in  jsonItem["menu"]  {
            BDarray.append(singleJsonItem.1.stringValue)
        }
        
        var BFarray: [String] = []
        for singleJsonItem in  jsonItem["localisation"]  {
            BFarray.append(singleJsonItem.1.stringValue)
        }
        
        
        return DishResto(
            _id: jsonItem["_id"].stringValue,
            name: jsonItem["name"].stringValue,
            picture: jsonItem["picture"].stringValue,
            about: jsonItem["about"].stringValue,
            category:  BParray,
            reservation: BUarray,
            nbplaces: BCarray,
            menu: BDarray,
            localisation: BFarray,
            nbRate: jsonItem["nbRate"].intValue,
            rate: jsonItem["rate"].intValue
        )
    }
}


//
//  PinterestNetworking.swift
//  Pinterest
//
//  Created by Jessica Ellison on 3/23/17.
//  Copyright © 2017 JessCodes. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import PinterestSDK

class PinterestNetworking {
  func getBoardData(completionHandler: @escaping(_ response: [BoardDataModel])-> Void){
//  https://api.pinterest.com/v1/me/pins/?
//  access_token=<YOUR-ACCESS-TOKEN>
//  &fields=id,creator,note
//  &limit=1
    PDKClient.sharedInstance().getAuthenticatedUserBoards(withFields: ["id", "image", "description", "name", "privacy"], success: {
    (result) in
      guard let json = result?.parsedJSONDictionary["data"] as? [[String: Any]] else {
      return
    }
      var boardDataModel = [BoardDataModel]()
      for model in json {
        if let board = BoardDataModel(json: JSON(model)) {
          boardDataModel.append(board)
        }
      }
      completionHandler(boardDataModel)
    }
    , andFailure: nil
    )
  }

//  func getAuthCode() {
//    let requestURL = "https://api.pinterest.com/v1/oauth/"
//    let scopeArr: [String] = ["id","image","name","description", "privacy"]
//    let arrForJSON: [String:AnyObject] = ["scope": scopeArr as AnyObject]
//    let parameters: [String: String] = ["reponse_type": ("code" as AnyObject) as! String, "state": ("kittens" as AnyObject) as! String, "client_id": ("4891270256831510477" as AnyObject) as! String, "scope": scopeArr as AnyObject, "redirect_uri": ("pdk4891270256831510477" as AnyObject) as! String]
//    
//    let convertableURL = requestURL as URLConvertible
//    Alamofire.request(convertableURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
//      
//      guard let value = response.result.value else {
//        print("no response")
//        return
//      }
//      print(response)
//    }
//
//  }
//  
//  func getAccessToken() {
//    let requestURL = "https://api.pinterest.com/v1/oauth/token?"
//    let parameters: [String: String] = ["grant_type": ("authorization_code" as AnyObject) as! String, "client_id": ("4891270256831510477" as AnyObject) as! String, "client_secret": ("090cc08d6a37e3a3dd97814d6389c4e8ae24d3ea7d4462812caf062f36cdea21" as AnyObject) as! String, "code": ("pdk4891270256831510477" as AnyObject) as! String]
//  
//    let convertableURL = requestURL as URLConvertible
//      Alamofire.request(convertableURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
//        
//      guard let value = response.result.value else {
//          print("no response")
//        return
//      }
//      print(response)
//    }
//  }
//  
//}
}

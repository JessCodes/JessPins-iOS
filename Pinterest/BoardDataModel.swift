//
//  BoardDataModel.swift
//  Pinterest
//
//  Created by Jessica Ellison on 3/24/17.
//  Copyright © 2017 JessCodes. All rights reserved.
//

import Foundation
import SwiftyJSON

class BoardDataModel  {
  var description:String =  ""
  var name:String = ""
  var image: String = ""
  
  init(name: String) {
    self.name = name
  }
  
  convenience init?(json: JSON) {
    if let name = json["name"].string {
      self.init(name: name)
      self.description = json["description"].string!
      self.image = json["image"]["60x60"]["url"].string!
    return
    }
    return nil
  }
  
}

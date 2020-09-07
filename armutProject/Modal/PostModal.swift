//
//  File.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 6.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import Foundation

struct PostModal : Codable{

    var title : String?
    var category : String?
    var imageURL : String?
    var link : String?
    
    
    init(json : [String:Any]) {
           
           title = json["title"] as? String ?? ""
           category = json["category"] as? String ?? ""
           imageURL = json["image_url"] as? String ?? ""
           link = json["link"] as? String ?? ""
         
    }
}

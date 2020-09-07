//
//  Post.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 5.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import Foundation

struct TrendingModal{

    var id : Int
    var serviceId : Int
    var name : String
    var longName : String
    var imageURL : String
    var proCount : Int
    var averageRating : Double
    var completedJob : Int
    
    init(json : [String:Any]) {
        
        id = json["id"] as? Int ?? -1
        serviceId = json["service_id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        longName = json["long_name"] as? String ?? ""
        imageURL = json["image_url"] as? String ?? ""
        proCount = json["pro_count"] as? Int ?? -1
        averageRating = json["average_rating"] as? Double ?? 0.0
        completedJob = json["completed_jobs_on_last_month"] as? Int ?? -1
    }  
}


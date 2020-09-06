//
//  Post.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 5.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import Foundation

class PostCategory {
    
    var categoryName : String?
    var posts : [Post]?
    
}

class Post {
    
    var id : Int?
    var serviceId : Int?
    var name : String?
    var longName : String?
    var imageURL : URL?
    var proCount : Int?
    
}

/*struct onePost {
    let id : Int
    let serviceId : Int
    let name : String
    let longName : String
    let imageUrl : URL
    let proCount : Int
    let averageRating : Double
    let completedJobsOnLastMonth : Int
  }
 */

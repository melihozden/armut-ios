//
//  PostService.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 4.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import UIKit

class PostService {
    
   /* static func fetchPosts(completion : @escaping ([TrendingModal]) -> Void){
        
        // Fetch All Posts
        var trendingPosts = [TrendingModal]()
         
        let requestURL = URL(string: "https://my-json-server.typicode.com/engincancan/case/home")
                 
        let request = URLRequest(url: requestURL!)
        let session = URLSession(configuration : URLSessionConfiguration.default)
        
        
        let task = session.dataTask(with: request) { (data,response,error) in
                
        guard let jsonData = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String : Any] else {return}
                
        for json in jsonData["trending"] as! [[String : Any]] {
            let post = TrendingModal(dictionary: json )
            trendingPosts.append(post)
        }
        
        print("DEBUG : Trending :  \(trendingPosts.count)")
        
        
     }
        completion(trendingPosts)
        task.resume()
    }
    
    static func getPostDetail(id : Int){
        
        let requestURL = URL(string: "https://my-json-server.typicode.com/engincancan/case/service/\(id)")
                 
        let request = URLRequest(url: requestURL!)
        let session = URLSession(configuration : URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data,response,error) in
                
        guard let jsonData = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String : Any] else {return}
            
            let post = TrendingModal(dictionary: jsonData)
            
            print(post.id)
            print(post.serviceId)
            print(post.name)
            print(post.longName)
            print(post.imageURL)
            print(post.proCount)
            print(post.averageRating)
            print(post.completedJob)
           
            
    }
        
        task.resume()
        
}
 */
    
}

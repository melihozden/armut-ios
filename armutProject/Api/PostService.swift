//
//  PostService.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 4.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import UIKit

class PostService : NSObject {
    
    
     func fetchAllPosts() {
        
        guard let requestURL = URL(string: "https://my-json-server.typicode.com/engincancan/case/home") else {return}
         
        let request = URLRequest(url: requestURL)
        let session = URLSession(configuration : URLSessionConfiguration.default)
        var posts : Array<Dictionary<String,Any>> = []
        
        let task = session.dataTask(with: request) { (data,response,error) in
        
            guard let jsonData = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String : Any] else {return}
        
            
            print(jsonData["posts"])
            
        }
        
        task.resume()
        
    }
    
    
    
    
}

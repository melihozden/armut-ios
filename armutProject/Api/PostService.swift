//
//  PostService.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 4.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import UIKit

class PostService {
    
    
     func fetchAllPosts() {
        
       let requestURL = URL(string: "https://my-json-server.typicode.com/engincancan/case/home")
        
            let postData = try! Data(contentsOf: requestURL!)
            print(postData)
            
            let jsonData = try! JSONSerialization.jsonObject(with: postData, options: [])
            print(jsonData)
                   
    }
    
    
    
    
}

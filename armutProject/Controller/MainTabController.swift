//
//  MainTabController.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 4.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import UIKit

class MainTabController : UITabBarController{
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    // MARK: - Selectors
    
    
    // MARK: - Helpers
    
    func configureViewController(){
           
        let feed = FeedController()
        let nav1 = templateNavigationController(title: "Services",image:UIImage(named: "Colored"),rootViewController:feed)
           
        let jobs = JobsController()
        let nav2 = templateNavigationController(title: "Jobs",image:UIImage(named: "Lines"),rootViewController:jobs)
          
        let notifications = NotificationsController()
        let nav3 = templateNavigationController(title:  "Notifications",image:UIImage(named: "Lines1"),rootViewController:notifications)
           
        let profile = ProfileController()
        let nav4 = templateNavigationController(title: "Profile",image:UIImage(named: "Lines3"),rootViewController:profile)
           
           viewControllers = [nav1,nav2,nav3,nav4]
           
        
       }
       
    func templateNavigationController(title: String, image : UIImage?, rootViewController : UIViewController) -> UINavigationController{
           
           let nav = UINavigationController(rootViewController: rootViewController)
            nav.tabBarItem.image = image
            nav.tabBarItem.title = title
            nav.navigationBar.barTintColor = .white
          
           return nav
       }
   
    
    
    
}

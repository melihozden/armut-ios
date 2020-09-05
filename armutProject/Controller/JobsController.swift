//
//  JobsController.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 4.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import UIKit

class JobsController : UIViewController{
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Selectors
    
    // MARK: - Helper
    func configureUI(){
        
        navigationItem.title = "Jobs"
        view.backgroundColor = .white
        
    }
    
    
    
    
}

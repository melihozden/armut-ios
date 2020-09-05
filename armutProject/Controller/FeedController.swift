//
//  FeedController.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 4.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import UIKit
//import SDWebImage

class FeedController : UIViewController{


    private let searchController = UISearchController(searchResultsController: nil)
    
    
    
 // MARK: - Properties

    let scrollView = UIScrollView()
    private let averageIncomeLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Hello World"
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        
        return lb
    }()
    
    
// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(averageIncomeLabel)
        averageIncomeLabel.anchor(top : view.safeAreaLayoutGuide.topAnchor)
        
        configureUI()
        configureSearchController()
        
    }

// MARK: - Selectors

// MARK: - Helpers
    
    func configureUI(){
        
        let imageView = UIImageView(image: UIImage(named: "armut-logo-color"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        view.backgroundColor = .white
    
        let deneme = PostService()
        deneme.fetchAllPosts()
        
    }
    
    
    func configureSearchController(){
        
        let micImage = UIImage(named: "Action")
        
        //searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.setImage(micImage, for: .bookmark, state: .normal)
        searchController.searchBar.showsBookmarkButton = true
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
    
    
}

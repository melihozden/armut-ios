//
//  FeedController.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 4.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import UIKit
//import SDWebImage


private let trendingPostCell = "TrendingPostCell"
private let categoryPostCell = "CategoryPostCell"
private let blogPostCell = "BlogPostCell"

class FeedController : UIViewController, UIScrollViewDelegate{


    private let searchController = UISearchController(searchResultsController: nil)
    var scrollView = UIScrollView()
    var contentView = UIView()
    
    var postCategories : [PostCategory]?
    
 // MARK: - Properties
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
        
    }()
    
    private let titleLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Trending services"
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        
        return lb
    }()
    
    private let categoryLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Temizlik"
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        
        return lb
    }()
    
    private let blogLabel : UILabel = {
        let lb = UILabel()
        lb.text = "Latest from the blog"
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        
        return lb
    }()
    
    
// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupViews()
        configureSearchController()
        
        
        
    }

// MARK: - Selectors

// MARK: - API
    
    // Fetch all posts
    func fetchPosts(){
        
        
        
        
    }
    
    
// MARK: - Helpers
    
    func setupScrollView(){
        
        //scrollView.contentSize = CGSize(width: 320, height: 3000)
        
        // Vertical Scrolling Adjustment
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        //scrollView.addSubview(contentView)
        
        scrollView.anchor(top : view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
      
        
        let imageView = UIImageView(image: UIImage(named: "armut-logo-color"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        view.backgroundColor = .white
    
        
       let deneme = PostService()
        deneme.fetchAllPosts()
        
    }
    
    func setupViews(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TrendingPostCell.self, forCellWithReuseIdentifier: trendingPostCell)
        collectionView.register(CategoryPostCell.self, forCellWithReuseIdentifier: categoryPostCell)
        collectionView.register(BlogPostCell.self, forCellWithReuseIdentifier: blogPostCell)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
        
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

extension FeedController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryPostCell, for: indexPath) as! CategoryPostCell
            
            return cell
        }
        else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: blogPostCell, for: indexPath) as! BlogPostCell
                       
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendingPostCell, for: indexPath) as! TrendingPostCell
        cell.feedController = self
        
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: view.frame.width, height: 225)
        }
        else if indexPath.section == 2 {
            return CGSize(width: view.frame.width, height: 350)
        }
        return CGSize(width: view.frame.width , height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
             return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
        else if section == 2 {
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        
    }
    
    func showPostDetail(){
        
        let postController = PostController()
        self.navigationController?.pushViewController(postController, animated: true)
               
        print("Out Girdi") 
    }
    
}

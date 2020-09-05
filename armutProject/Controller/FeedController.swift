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

class FeedController : UIViewController{


    private let searchController = UISearchController(searchResultsController: nil)
    let scrollView = UIScrollView()
    let contentView = UIView()
    
 // MARK: - Properties

    // Trending Services CollectionView
    fileprivate let trendingPostCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false;
        cv.register(TrendingPostCell.self, forCellWithReuseIdentifier: trendingPostCell)
        
        return cv
    }()
    
    // Category Collection View
    fileprivate let categoryCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false;
       // cv.register(TrendingPostCell.self, forCellWithReuseIdentifier: trendingPostCell)
        
        return cv
    }()
    
    // Blogs Collection View
    fileprivate let blogsCollectionView : UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.translatesAutoresizingMaskIntoConstraints = false;
          // cv.register(TrendingPostCell.self, forCellWithReuseIdentifier: trendingPostCell)
           
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
    
    
// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // view.addSubview(averageIncomeLabel)
       // averageIncomeLabel.anchor(top : view.safeAreaLayoutGuide.topAnchor)
        
        setupScrollView()
        configureSearchController()
        setupViews()
        
        
    }

// MARK: - Selectors

// MARK: - API
    
// MARK: - Helpers
    
    func setupScrollView(){
        
        // Vertical Scrolling Adjustment
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        // Navigation Center Logo
        let imageView = UIImageView(image: UIImage(named: "armut-logo-color"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        view.backgroundColor = .white
    
        
              
        
    //    let deneme = PostService()
    //    deneme.fetchAllPosts()
        
    }
    
    func setupViews(){
        
        trendingPostCollectionView.delegate = self
        trendingPostCollectionView.dataSource = self
        
        // Title
        view.addSubview(titleLabel)
        titleLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor , paddingTop: 10,paddingLeft: 10)
        
        // First CollectionView
        contentView.addSubview(trendingPostCollectionView)
        trendingPostCollectionView.backgroundColor = .white
        
        trendingPostCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
        trendingPostCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        trendingPostCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        trendingPostCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true
        
        // Category Label
        
        contentView.addSubview(categoryLabel)
        categoryLabel.anchor(top:trendingPostCollectionView.bottomAnchor, left: view.leftAnchor , paddingTop: 10,paddingLeft: 10)
        
        
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

extension FeedController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 1.5, height: collectionView.frame.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendingPostCell, for: indexPath) as! TrendingPostCell
        
        cell.backgroundColor = .white
        //cell.layer.cornerRadius = 10
        
        return cell
    }
    
    
    
    
    
}

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
        cv.register(CategoryPostCell.self, forCellWithReuseIdentifier: categoryPostCell)
        
        return cv
    }()
    
    // Blogs Collection View
    fileprivate let blogsCollectionView : UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.translatesAutoresizingMaskIntoConstraints = false;
          cv.register(BlogPostCell.self, forCellWithReuseIdentifier: blogPostCell)
           
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
        
        
       // view.addSubview(averageIncomeLabel)
       // averageIncomeLabel.anchor(top : view.safeAreaLayoutGuide.topAnchor)
        
        setupScrollView()
        setupViews()
        configureSearchController()
        
        
        
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
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        blogsCollectionView.delegate = self
        blogsCollectionView.dataSource = self
        
        // Title
        contentView.addSubview(titleLabel)
        titleLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor , paddingTop: 10,paddingLeft: 10)
        
        // Trending CollectionView
        view.addSubview(trendingPostCollectionView)
        trendingPostCollectionView.backgroundColor = .white
        
        trendingPostCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
        trendingPostCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        trendingPostCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        trendingPostCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true
        
        // Category Label
        contentView.addSubview(categoryLabel)
        categoryLabel.anchor(top:trendingPostCollectionView.bottomAnchor, left: view.leftAnchor , paddingTop: 10,paddingLeft: 10)
        
        // Category CollectionView
        view.addSubview(categoryCollectionView)
        categoryCollectionView.backgroundColor = .white
        
        categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20).isActive = true
        
        categoryCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        categoryCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        categoryCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 5).isActive = true
        
        // Blog Label
        contentView.addSubview(blogLabel)
        blogLabel.anchor(top:categoryCollectionView.bottomAnchor, left: view.leftAnchor , paddingTop: 10,paddingLeft: 10)
        
        // Blogs CollectionView
        view.addSubview(blogsCollectionView)
        blogsCollectionView.backgroundColor = .white
        
        blogsCollectionView.topAnchor.constraint(equalTo: blogLabel.bottomAnchor, constant: 20).isActive = true
        
        blogsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        blogsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        blogsCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height ).isActive = true
        
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
        if collectionView == self.trendingPostCollectionView{
            return CGSize(width: collectionView.frame.width / 1.5, height: collectionView.frame.height )
            
            
        }
        else if collectionView == self.categoryCollectionView{
             return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height )
        }
        else {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height  )
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.trendingPostCollectionView{
            return 5
        }
        else if collectionView == self.categoryCollectionView{
            return 3
        }
        else{
            return 4
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.trendingPostCollectionView{
        
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: trendingPostCell, for: indexPath) as! TrendingPostCell
            cellA.backgroundColor = .white
            
            return cellA
        }
        
        else if collectionView == self.categoryCollectionView{
            
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: categoryPostCell, for: indexPath) as! CategoryPostCell
            cellB.backgroundColor = .white
            
            return cellB
            
        }
        else {
            
            let cellC = collectionView.dequeueReusableCell(withReuseIdentifier: blogPostCell, for: indexPath) as! BlogPostCell
                       cellC.backgroundColor = .white
                       
            return cellC
            
        }
        
    }
    
    
    
    
    
}

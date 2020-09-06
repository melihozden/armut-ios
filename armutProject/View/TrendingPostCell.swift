//
//  PostCell.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 5.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import UIKit

class TrendingPostCell : UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var feedController : FeedController?
    
    var postCategory: PostCategory? {
        
        didSet{
            if let name = postCategory?.categoryName {
                titleLabel.text = name
            }
        }
        
    }
    
    let trendingCellId = "trendingCellId"
    
    // MARK: - Properties
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        
       return cv
    }()
    
    private let titleLabel : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        lb.textColor = .black
        lb.numberOfLines = 0
        lb.text = "Trending"
        return lb
    }()
    
   
   
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selector
    
    // MARK: - API
    
    // MARK: - Helper
    
    func setup(){
        
        backgroundColor = .white
      
         collectionView.delegate = self
         collectionView.dataSource = self
         
         collectionView.register(LittleCell.self, forCellWithReuseIdentifier: trendingCellId)
         
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 20)
        
         addSubview(collectionView)
        collectionView.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // JSON Array Data Count will assign here
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendingCellId, for: indexPath) as! LittleCell
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        feedController?.showPostDetail()
        //print("Inside Girdi")
    }
    
    private class LittleCell: UICollectionViewCell{
        
        // MARK: - Properties
        private let postImageView : UIImageView = {
            
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFill
            image.image = #imageLiteral(resourceName: "uniYildiz")
            image.clipsToBounds = true
            image.setHeight(height: 175)
            
            return image
        }()
        
        private let postTitleLabel : UILabel = {
           let lb = UILabel()
            lb.font = UIFont.boldSystemFont(ofSize: 16)
            lb.textColor = .black
            lb.numberOfLines = 0
            lb.text = "Ev Temizliği"
            return lb
        }()
        
        private let prosLabel : UILabel = {
           let lb = UILabel()
            lb.font = UIFont.boldSystemFont(ofSize: 12)
            lb.textColor = UIColor.prosColor
            lb.numberOfLines = 0
            lb.text = "78 Pros near you"
            return lb
        }()
        
        // MARK: - Lifecycle
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            setup()
        }
        
        func setup(){
            
            backgroundColor = .white
            
            addSubview(postImageView)
            postImageView.anchor(top : topAnchor, left: leftAnchor,right: rightAnchor, paddingTop: 0,paddingRight: 0)
            
            let stack = UIStackView(arrangedSubviews: [postTitleLabel,prosLabel])
            stack.axis = .vertical
            stack.distribution = .fillProportionally
            stack.spacing = 4
            
            addSubview(stack)
            stack.anchor(top: postImageView.bottomAnchor,left: leftAnchor, right: rightAnchor,paddingTop: 12, paddingLeft: 12, paddingRight: 12)
            
        }
        
        // MARK: - API
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
}

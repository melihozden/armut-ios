//
//  BlogPostCell.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 5.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import UIKit

class BlogPostCell : UICollectionViewCell {
    
    // MARK: - Properties
      private let postImageView : UIImageView = {
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       image.contentMode = .scaleAspectFill
       image.image = #imageLiteral(resourceName: "uniYildiz")
       image.clipsToBounds = true
       image.layer.cornerRadius = 5
       image.setHeight(height: 120)
       
       return image
           
       }()
       
       private let postTitleLabel : UILabel = {
          let lb = UILabel()
           lb.font = UIFont.boldSystemFont(ofSize: 14)
           lb.textColor = .black
           lb.numberOfLines = 0
           lb.text = "EV DEKORASYONU"
           return lb
       }()
       
       private let prosLabel : UILabel = {
          let lb = UILabel()
           lb.font = UIFont.boldSystemFont(ofSize: 10)
           lb.textColor = UIColor.prosColor
           lb.numberOfLines = 0
           lb.text = "Ev Dekorasyonunda Mercan Rengi Devrimi"
           return lb
       }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    // MARK: - Properties
    
}

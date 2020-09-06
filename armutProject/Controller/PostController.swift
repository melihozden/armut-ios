//
//  PostController.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 4.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import UIKit

   /* let prosText = NSMutableAttributedString(string: "3785 pros near you")
    let ratingText = NSMutableAttributedString(string: "4.7 average rating")
    let complatedJobText = NSMutableAttributedString(string: "Last month 115.789 cleaning job")
    let freeChangeText = NSMutableAttributedString(string: "Free of change")
    let serviceGuaranteeText = NSMutableAttributedString(string: "Service Guaranteed")
    
    let prosImageAttachment = NSTextAttachment()
    let ratingImageAttachment = NSTextAttachment()
    let complatedImageAttachment = NSTextAttachment()
    let freeChangeImageAttachment = NSTextAttachment()
    let serviceGuaranteeImageAttachment = NSTextAttachment()
  
    prosImageAttachment.image = UIImage(named: "icn-profesyonel-number-orange")
    prosImageAttachment.image = UIImage(named: "icn-profesyonel-number-orange")
    prosImageAttachment.image = UIImage(named: "icn-profesyonel-number-orange")
    prosImageAttachment.image = UIImage(named: "icn-profesyonel-number-orange")
    prosImageAttachment.image = UIImage(named: "icn-profesyonel-number-orange")
*/

class PostController : UIViewController{
    
  
    
    // MARK: - Properties
    private let postImageView : UIImageView = {
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       image.contentMode = .scaleAspectFill
       image.image = #imageLiteral(resourceName: "uniYildiz")
       image.clipsToBounds = true
       image.setHeight(height: 250)
       
       return image
           
    }()
    
    private let prosLabel : UILabel = {
       let lb = UILabel()
        lb.set(image: UIImage(named: "icn-profesyonel-number-orange")!, with: " 3785 pros near you")
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.textColor = .darkGray
        
        return lb
    }()
    
    private let ratingLabel : UILabel = {
       let lb = UILabel()
        lb.set(image: UIImage(named: "icn-star-average")!, with: " 4.7 average rating")
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.textColor = .darkGray
        
        return lb
    }()
    
    private let complatedJobLabel : UILabel = {
       let lb = UILabel()
        lb.set(image: UIImage(named: "icn-job-done-orange")!, with: " Last month 115.789 cleaning job complated.")
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.textColor = .darkGray
        
        return lb
    }()
    
    private let freeChangeLabel : UILabel = {
       let lb = UILabel()
        lb.set(image: UIImage(named: "icn-ucretsiz-kullan-orange")!, with: " Free of Change")
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.textColor = .darkGray
        
        return lb
    }()
    
    private let serviceGuaranteeLabel : UILabel = {
          let lb = UILabel()
        lb.set(image: UIImage(named: "icn-hizmet-garanti-orange")!, with: " Service Guaranteed")
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.textColor = .darkGray
           
           return lb
       }()
    
    private let dividerLine : UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        uv.translatesAutoresizingMaskIntoConstraints = false
        
        return uv
    }()
    
    
    private let howItWorks : UILabel = {
       let lb = UILabel()
        lb.text = "How it works"
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        lb.textColor = .darkGray
        return lb
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Selectors
    
    // MARK: - Helper
    func configureUI(){
        
        view.backgroundColor = .white
        
        view.addSubview(postImageView)
        postImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        let stack = UIStackView(arrangedSubviews: [prosLabel,ratingLabel,complatedJobLabel,freeChangeLabel,serviceGuaranteeLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 25
        
        view.addSubview(stack)
        stack.anchor(top: postImageView.bottomAnchor,left: view.leftAnchor, right: view.rightAnchor,paddingTop: 16, paddingLeft: 12, paddingRight: 12)
        
        view.addSubview(dividerLine)
        dividerLine.anchor(top : stack.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
      
        
        view.addSubview(howItWorks)
        howItWorks.anchor(top : stack.bottomAnchor, left: view.leftAnchor,right: view.rightAnchor,paddingTop: 20,paddingLeft: 12,paddingRight: 12)
       
        
    }
    
}

extension UILabel {
  func set(image: UIImage, with text: String) {
    let attachment = NSTextAttachment()
    attachment.image = image
    attachment.bounds = CGRect(x: 0, y: 0, width: 16, height: 12)
    let attachmentStr = NSAttributedString(attachment: attachment)

    let mutableAttributedString = NSMutableAttributedString()
    mutableAttributedString.append(attachmentStr)

    let textString = NSAttributedString(string: text, attributes: [.font: self.font!])
    mutableAttributedString.append(textString)

    self.attributedText = mutableAttributedString
    
  }
}

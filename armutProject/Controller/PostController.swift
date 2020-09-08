//
//  PostController.swift
//  armutProject
//
//  Created by Melih ÖZDEN on 4.09.2020.
//  Copyright © 2020 Melih ÖZDEN. All rights reserved.
//

import UIKit

class PostController : UIViewController{

    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var serviceID = -1
    
    // MARK: - Properties
    private let postImageView : UIImageView = {
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       image.contentMode = .scaleAspectFill
       image.clipsToBounds = true
       image.setHeight(height: 250)
       
       return image
           
    }()
    
    private let nameLabel : UILabel = {
       let lb = UILabel()
        lb.text = ""
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        lb.textColor = .darkGray
        
        return lb
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
    
    let continueButton : UIButton = {
       let bt = UIButton()
        bt.setTitle("Devam", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        bt.layer.cornerRadius = 10
        bt.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        bt.setHeight(height: 50)
        bt.backgroundColor = .buttonColor
        
        return bt
        
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        configureUI()
        
    }
    
    // MARK: - API
    func fetchDetail(completion : @escaping (TrendingModal) -> Void){
        
        let urlString = "https://my-json-server.typicode.com/engincancan/case/service/\(serviceID)"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard let data = data else {return}
           
         do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {return}
         
            let post = TrendingModal(json: json)
            completion(post)
            
            }
            catch let err {
                print("ERROR Serializing json : ", err)
            }
        }.resume()
    }
  
    // MARK: - Helper
    
    func setupScrollView(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        contentView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    
    func configureUI(){
        
        fetchDetail { post in
            
            self.fillData(name : post.name, prosCount: post.proCount, averageStar: post.averageRating, lastMonth: post.completedJob, serviceName: post.name, imageURL: post.imageURL)
            
            
        }
        
        print("DEBUG : SERVICE ID : ",serviceID)
        
        view.backgroundColor = .white
        
        contentView.addSubview(postImageView)
        postImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        contentView.addSubview(nameLabel)
        nameLabel.anchor(top : postImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,paddingLeft: 12)
        
        let stack = UIStackView(arrangedSubviews: [prosLabel,ratingLabel,complatedJobLabel,freeChangeLabel,serviceGuaranteeLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 25
        
        contentView.addSubview(stack)
        stack.anchor(top: nameLabel.bottomAnchor,left: view.leftAnchor, right: view.rightAnchor,paddingTop: 16, paddingLeft: 12, paddingRight: 12)
        
        contentView.addSubview(dividerLine)
        dividerLine.anchor(top : stack.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
      
        
        contentView.addSubview(howItWorks)
        howItWorks.anchor(top : stack.bottomAnchor, left: view.leftAnchor,right: view.rightAnchor,paddingTop: 20,paddingLeft: 12,paddingRight: 12)
        
        contentView.addSubview(continueButton)
        continueButton.anchor(top : howItWorks.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 12, paddingRight: 12 )
       
        
    }
    
    func fillData(name : String, prosCount : Int, averageStar : Double, lastMonth : Int, serviceName : String, imageURL : String) {
       
        DispatchQueue.main.async {
            
            self.nameLabel.text = "\(name)"
            self.prosLabel.set(image: UIImage(named: "icn-profesyonel-number-orange")!, with: " \(prosCount) pros near you")
            self.ratingLabel.set(image: UIImage(named: "icn-star-average")!, with: " \(averageStar) average rating")
            self.complatedJobLabel.set(image: UIImage(named: "icn-job-done-orange")!, with: " Last month \(lastMonth) cleaning job complated")
            
            guard let postImageUrl = URL(string: imageURL) else {return}
            self.postImageView.sd_setImage(with: postImageUrl, completed: nil)
        }
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

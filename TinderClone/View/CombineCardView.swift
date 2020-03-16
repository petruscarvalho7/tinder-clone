//
//  CombineCardView.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 14/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import UIKit

class CombineCardView: UIView {
    
    var user: User? {
        didSet {
            if let user = user {
                photoImageView.image = UIImage(named: user.photo)
                nameLabel.text = user.name
                ageLabel.text = String(user.age)
                sloganLabel.text = user.slogan
            }
        }
    }
    
    let photoImageView: UIImageView = .imageView("pessoa-1")
    let nameLabel: UILabel = .textBoldLabel(32, text: "Laura")
    let ageLabel: UILabel = .textLabel(32, text: "20")
    let sloganLabel: UILabel = .textLabel(20, text: "Chega na Burok")
    
    let likeImageView: UIImageView = .iconCard("card-like")
    let dislikeImageView: UIImageView = .iconCard("card-dislike")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        nameLabel.addShadow()
        ageLabel.addShadow()
        
        addSubview(photoImageView)
        
        photoImageView.fillAllSuperview()
        
        let ageAndNameStackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel, UIView()])
        ageAndNameStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [ageAndNameStackView, sloganLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(likeImageView)
        addSubview(dislikeImageView)
        addSubview(stackView)
        
        stackView.fill(
            top: nil,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: 16, right: 16)
        )
        
        likeImageView.fill(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: nil,
            bottom: nil,
            padding: .init(top: 20, left: 20, bottom: 0, right: 0)
        )
        
        dislikeImageView.fill(
           top: topAnchor,
           leading: nil,
           trailing: trailingAnchor,
           bottom: nil,
           padding: .init(top: 20, left: 0, bottom: 0, right: 20)
       )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

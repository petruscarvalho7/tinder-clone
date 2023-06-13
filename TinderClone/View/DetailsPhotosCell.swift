//
//  DetailsPhotosCell.swift
//  TinderClone
//
//  Created by Petrus Carvalho on 12/06/23.
//  Copyright © 2023 PETRUS CARVALHO. All rights reserved.
//

import UIKit

class DetailsPhotosCell: UICollectionViewCell {
    
    let descriptionLabel: UILabel = .textBoldLabel(16)
    
    let slidesPhotosVC = SlidePhotosVC()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    fileprivate func setupViews() {
        backgroundColor = .white
        
        descriptionLabel.text = "Instagram Photos"
        descriptionLabel.textColor = .black
        
        addSubview(descriptionLabel)
        descriptionLabel.fill(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: UIEdgeInsets(
                top: 0,
                left: 20,
                bottom: 0,
                right: 20
            )
        )
        
        addSubview(slidesPhotosVC.view)
        slidesPhotosVC.view.fill(
            top: descriptionLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor, 
            bottom: bottomAnchor
        )
    }
}

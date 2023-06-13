//
//  SlidePhotoItemCell.swift
//  TinderClone
//
//  Created by Petrus Carvalho on 13/06/23.
//  Copyright © 2023 PETRUS CARVALHO. All rights reserved.
//

import UIKit

class SlidePhotoItemCell: UICollectionViewCell {
    
    var photo: String = "" {
        didSet {
            imageView.image = UIImage(named: photo)
        }
    }

    var imageView: UIImageView = .imageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews() {
        addSubview(imageView)
        
        imageView.fill(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor
        )
        
        imageView.layer.cornerRadius = 5
    }
}

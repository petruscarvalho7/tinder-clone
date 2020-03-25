//
//  DetailsHeaderView.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 24/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import UIKit

class DetailsHeaderView: UICollectionReusableView {
    
    let imageBackground: UIImageView = .imageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageBackground)
        
        imageBackground.fillAllSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

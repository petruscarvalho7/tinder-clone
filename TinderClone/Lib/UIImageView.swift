//
//  UIImageView.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 15/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import UIKit

extension UIImageView {
    
    static func imageView(_ name: String? = nil) -> UIImageView {
        let imageView = UIImageView()
        if let name = name {
            imageView.image = UIImage(named: name)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    static func iconCard(_ name: String? = nil) -> UIImageView {
        let imageView = UIImageView()
        if let name = name {
            imageView.image = UIImage(named: name)
        }
        imageView.size(size: .init(width: 70, height: 70))
        imageView.alpha = 0.0
        return imageView
    }
}

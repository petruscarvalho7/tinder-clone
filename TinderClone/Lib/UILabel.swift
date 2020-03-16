//
//  UILabel.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 14/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import UIKit

extension UILabel {
    
    static func textLabel(_ size: CGFloat, textColor: UIColor = .white, numberOfLines: Int = 1, text: String = "") -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.text = text
        return label
    }
    
    static func textBoldLabel(_ size: CGFloat, textColor: UIColor = .white, numberOfLines: Int = 1, text: String = "") -> UILabel {
           let label = UILabel()
           label.font = UIFont.boldSystemFont(ofSize: size)
           label.textColor = textColor
           label.numberOfLines = numberOfLines
           label.text = text
           return label
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = true
    }
}

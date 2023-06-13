//
//  UIButton.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 15/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import UIKit

extension UIButton {
    
    static func btnFooter(_ name: String? = nil) -> UIButton {
        let btn = UIButton()
        btn.size(size: .init(width: 64, height: 64))
        if let name = name {
            btn.setImage(UIImage(named: name), for: .normal)
        }
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 32
        btn.clipsToBounds = true
        
        //shadow
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowRadius = 3.0
        btn.layer.shadowOpacity = 0.1
        btn.layer.shadowOffset = CGSize(width: 1, height: 1)
        btn.layer.masksToBounds = false
        
        return btn
    }
    
    static func btnBack() -> UIButton {
        let btn = UIButton()
        btn.size(size: .init(width: 32, height: 32))
        btn.setImage(UIImage(named: "icon-back"), for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 16
        btn.clipsToBounds = true
        
        //shadow
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowRadius = 3.0
        btn.layer.shadowOpacity = 0.1
        btn.layer.shadowOffset = CGSize(width: 1, height: 1)
        btn.layer.masksToBounds = false
        
        return btn
    }
    
    static func btnMenu(_ name: String? = nil) -> UIButton {
        let btn = UIButton()
        btn.size(size: .init(width: 32, height: 32))
        if let name = name {
            btn.setImage(UIImage(named: name), for: .normal)
        }
        return btn
    }
    
    static func btnTextField(name: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(name, for: .normal)
        btn.setTitleColor(UIColor(red: 62/255, green: 163/255, blue: 255/255, alpha: 1), for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return btn
    }
    
    static func btnText(name: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(name, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return btn
    }
}

//
//  LoadingView.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 15/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    let loadingView: UIView = {
        let loading = UIView()
        loading.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        loading.backgroundColor = UIColor(red: 218/255, green: 99/255, blue: 111/255, alpha: 1)
        loading.layer.cornerRadius = 50
        loading.layer.borderWidth = 1
        loading.layer.borderColor = UIColor.red.cgColor
        return loading
    }()
    
    let profileImageView: UIImageView = {
        let profile = UIImageView()
        profile.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        profile.layer.cornerRadius = 50
        profile.layer.borderWidth = 5
        profile.layer.borderColor = UIColor.white.cgColor
        profile.clipsToBounds = true
        profile.image = UIImage(named: "perfil")
        return profile
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(loadingView)
        loadingView.center = center
        
        addSubview(profileImageView)
        profileImageView.center = center
        
        self.animation()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func animation() {
        UIView.animate(withDuration: 1.3, animations: {
            self.loadingView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
            self.loadingView.center = self.center
            self.loadingView.layer.cornerRadius = 125
            self.loadingView.alpha = 0.3
        }){ (_) in
            self.loadingView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            self.loadingView.center = self.center
            self.loadingView.layer.cornerRadius = 50
            self.loadingView.alpha = 1
            
            self.animation()
        }
    }
}

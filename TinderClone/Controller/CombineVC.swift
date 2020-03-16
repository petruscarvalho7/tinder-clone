//
//  CombineVC.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 14/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import UIKit

enum ActionLike {
    case like
    case dislike
    case superlike
}

class CombineVC: UIViewController {
    
    var users: [User] = []
    
    let profileBtn: UIButton = .btnMenu("icone-perfil")
    let tinderBtn: UIButton = .btnMenu("icone-logo")
    let chatBtn: UIButton = .btnMenu("icone-chat")
    
    let dislikeBtn: UIButton = .btnFooter("icone-dislike")
    let superlikeBtn: UIButton = .btnFooter("icone-superlike")
    let likeBtn: UIButton = .btnFooter("icone-like")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemGroupedBackground
        
        let loading = LoadingView(frame: view.frame)
        view.insertSubview(loading, at: 0)
        
        addFooterAndMenuBtns()
        getUsers()
    }
    
    func getUsers() {
        //disable buttons before getusers
        dislikeBtn.isEnabled = false
        likeBtn.isEnabled = false
        superlikeBtn.isEnabled = false
        
        UserService.shared.getUsers { (users, err) in
            if let users = users {
                DispatchQueue.main.async {
                    //if users enabled btns
                    self.dislikeBtn.isEnabled = true
                    self.likeBtn.isEnabled = true
                    self.superlikeBtn.isEnabled = true
                    
                    self.users = users
                    self.addCards()
                }
            }
        }
    }
}

extension CombineVC {
    
    func addFooterAndMenuBtns() {
        
        //get safearea para iphones com notch
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        let top = window?.safeAreaInsets.top ?? 44
        let bottom = window?.safeAreaInsets.bottom ?? 32
        
        let footerStackView = UIStackView(arrangedSubviews: [UIView(), dislikeBtn, superlikeBtn, likeBtn, UIView()])
        footerStackView.distribution = .equalCentering
        
        let menuStackView = UIStackView(arrangedSubviews: [profileBtn, tinderBtn, chatBtn])
        menuStackView.distribution = .equalCentering
        
        view.addSubview(footerStackView)
        view.addSubview(menuStackView)
        
        footerStackView.fill(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: .init(top: 0, left: 16, bottom: bottom, right: 16))
        
        menuStackView.fill(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: nil,
            padding: .init(top: top, left: 16, bottom: 0, right: 16))
        
        dislikeBtn.addTarget(self, action: #selector(dislikeAction), for: .touchUpInside)
        likeBtn.addTarget(self, action: #selector(likeAction), for: .touchUpInside)
        superlikeBtn.addTarget(self, action: #selector(superlikeAction), for: .touchUpInside)
        
    }
    
}

extension CombineVC {
    
    func addCards() {
        
        for user in self.users {
            let card = CombineCardView()
            card.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height * 0.7)
            
            card.center = view.center
            card.user = user
            card.tag = user.id
            
            let gesture = UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(handlerCard))
            
            card.addGestureRecognizer(gesture)
            
            view.insertSubview(card, at: 1)
        }
    
    }
    
    func removeCard(_ card: CombineCardView) {
        card.removeFromSuperview()
        
        self.users = self.users.filter({ (user) -> Bool in
            return user.id != card.tag
        })
        
    }
    
    func matchVerify(user: User) {
        if user.match {
            let matchVC = MatchVC()
            matchVC.user = user
            matchVC.modalPresentationStyle = .fullScreen
            
            present(matchVC, animated: true, completion: nil)
        }
    }
}

extension CombineVC {
    
    @objc func dislikeAction() {
        animateCard(rotationAngle: -0.4, action: .dislike)
    }
    
    @objc func likeAction() {
        animateCard(rotationAngle: 0.4, action: .like)
    }
    
    @objc func superlikeAction() {
        animateCard(rotationAngle: 0, action: .superlike)
    }
    
    @objc func handlerCard(_ gesture: UIPanGestureRecognizer) {
        if let card = gesture.view as? CombineCardView {
            let point = gesture.translation(in: view)
            
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            let rotationAngle = point.x / view.bounds.width * 0.4
            
            if point.x > 0 {
                card.likeImageView.alpha = rotationAngle * 5
                card.dislikeImageView.alpha = 0
            } else {
                card.likeImageView.alpha = 0
                card.dislikeImageView.alpha = rotationAngle * 5 * -1
            }
            
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            if gesture.state == .ended {
                
                if card.center.x > self.view.bounds.width + 50 {
                    self.animateCard(rotationAngle: rotationAngle, action: .like)
                    return
                }
                
                if card.center.x < -50 {
                    self.animateCard(rotationAngle: rotationAngle, action: .dislike)
                    return
                }
                
                UIView.animate(withDuration: 0.3) {
                    card.center = self.view.center
                    card.transform = .identity
                    card.likeImageView.alpha = 0
                    card.dislikeImageView.alpha = 0
                }
            }
            
        }
    }
    
    func animateCard(rotationAngle: CGFloat, action: ActionLike) {
        if let user = self.users.first {
            for view in self.view.subviews {
                if view.tag == user.id {
                    if let card = view as? CombineCardView {
                        
                        let center: CGPoint
                        var like: Bool
                        
                        switch action {
                            case .dislike:
                                center = CGPoint(x: card.center.x - self.view.bounds.width, y: card.center.y + 50)
                                like = false
                            case .like:
                                center = CGPoint(x: card.center.x + self.view.bounds.width, y: card.center.y + 50)
                                like = true
                            case .superlike:
                                center = CGPoint(x: card.center.x, y: card.center.y - self.view.bounds.height)
                                like = true
                        }
                        
                        UIView.animate(withDuration: 1.2, animations: {
                            card.center = center
                            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
                            
                            //alphas like/dislike
                            card.likeImageView.alpha = like ? 1 : 0
                            card.dislikeImageView.alpha = like ? 0 : 1
                        }) { (_) in
                            self.removeCard(card)
                            self.matchVerify(user: user)
                        }
                    }
                }
            }
        }
    }
}

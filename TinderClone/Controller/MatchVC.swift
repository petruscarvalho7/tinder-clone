//
//  MatchVC.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 16/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import UIKit

class MatchVC: UIViewController, UITextFieldDelegate {
    
    var user: User? {
        didSet {
            if let user = user {
                photo.image = UIImage(named: user.photo)
                messageLabel.text = "\(user.name) também curtiu você"
            }
        }
    }
    
    let photo: UIImageView = .imageView("pessoa-1")
    let like: UIImageView = .imageView("icone-like")
    let messageLabel: UILabel = .textBoldLabel(18, textColor: .white, numberOfLines: 1)
    let messageTextField: UITextField = .textField()
    let sendBtn: UIButton = .btnTextField(name: "Enviar")
    let backBtn: UIButton = .btnText(name: "Voltar para o Tinder")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //open keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //close keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        setupLayout()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.sendMessage()
        
        return true
    }
    
    func setupLayout() {
        view.addSubview(photo)
        photo.fillAllSuperview()
        
        messageLabel.textAlignment = .center
        
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor]
        
        photo.layer.addSublayer(gradient)
        
        messageTextField.delegate = self
        messageTextField.addSubview(sendBtn)
        
        sendBtn.fill(
            top: messageTextField.topAnchor,
            leading: nil,
            trailing: messageTextField.trailingAnchor,
            bottom: messageTextField.bottomAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 16)
        )
        
        sendBtn.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)

        like.translatesAutoresizingMaskIntoConstraints = false
        like.heightAnchor.constraint(equalToConstant: 44).isActive = true
        like.contentMode = .scaleAspectFit
        
        backBtn.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [like, messageLabel, messageTextField, backBtn])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        
        stackView.fill(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: .init(top: 0, left: 32, bottom: 46, right: 32))
    }
}

extension MatchVC {
    
    @objc func sendMessage() {
        if let messageText = self.messageTextField.text {
            self.messageTextField.text = ""
            print(messageText)
        }
    }
    
    @objc func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
                UIView.animate(withDuration: duration) {
                    self.view.frame = CGRect(x: UIScreen.main.bounds.origin.x,
                                             y: UIScreen.main.bounds.origin.y,
                                             width: UIScreen.main.bounds.width,
                                             height: UIScreen.main.bounds.height - keyboardSize.height)
                    self.view.layoutIfNeeded()
                }
            }
        }
      }
    
    @objc func keyboardHide(notification: NSNotification) {
        if let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            UIView.animate(withDuration: duration) {
                self.view.frame = UIScreen.main.bounds
                self.view.layoutIfNeeded()
            }
        }
      }

}

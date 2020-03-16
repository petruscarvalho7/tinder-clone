//
//  UITextField.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 16/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import UIKit

extension UITextField {
    
    static func textField(height: CGFloat = 44,
                          returnedKeyType: UIReturnKeyType = .go,
                          placeholder: String = "Digitar algo interessante") -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: height).isActive = true
        textField.backgroundColor = .white
        textField.layer.cornerRadius =  8
        textField.textColor = .darkText
        textField.returnKeyType = returnedKeyType
        textField.placeholder = placeholder
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 0))
        textField.rightViewMode = .always
        
        return textField
    }
    
}

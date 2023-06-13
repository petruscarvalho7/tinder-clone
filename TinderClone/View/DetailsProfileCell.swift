//
//  DetailsProfileCell.swift
//  TinderClone
//
//  Created by Petrus Carvalho on 12/06/23.
//  Copyright © 2023 PETRUS CARVALHO. All rights reserved.
//

import UIKit

class DetailsProfileCell: UICollectionViewCell {
    
    let nameLabel: UILabel = .textBoldLabel(32)
    let ageLabel: UILabel = .textLabel(28)
    let phraseLabel: UILabel = .textLabel(18, numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        // text colors
        nameLabel.textColor = .black
        ageLabel.textColor = .black
        phraseLabel.textColor = .black
        
        let nameAgeStackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel, UIView()])
        nameAgeStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [nameAgeStackView, phraseLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.fillAllSuperview(padding: .init(
            top: 20,
            left: 20,
            bottom: 20,
            right: 20
        ))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func populateCell(name: String, age: String, phrase: String) {
        nameLabel.text = name
        ageLabel.text = age
        phraseLabel.text = phrase
    }
}

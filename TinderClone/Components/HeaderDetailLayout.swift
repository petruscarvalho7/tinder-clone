//
//  HeaderDetailLayout.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 24/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import UIKit

class HeaderDetailLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (att) in
            if att.representedElementKind == UICollectionView.elementKindSectionHeader {
                
                guard let collectionView = collectionView else { return }
                
                let contentOffSetY = collectionView.contentOffset.y
                
                att.frame = CGRect(
                    x: 0,
                    y: contentOffSetY,
                    width: collectionView.bounds.width,
                    height: att.bounds.height - contentOffSetY
                )
                
            }
        })
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

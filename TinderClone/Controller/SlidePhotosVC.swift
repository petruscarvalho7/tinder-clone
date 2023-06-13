//
//  SlidePhotosVC.swift
//  TinderClone
//
//  Created by Petrus Carvalho on 13/06/23.
//  Copyright © 2023 PETRUS CARVALHO. All rights reserved.
//

import UIKit

class SlidePhotosVC: UICollectionViewController {
    
    let cellId = "cellId"
    var userPhotos: [String]?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getUserPhotos()
        setupViews()
    }
    
    fileprivate func setupViews() {
        collectionView.backgroundColor = .white
        
        collectionView.register(SlidePhotoItemCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    private func getUserPhotos() {
        UserService.shared.getUsersPhotos{ (photos, err) in
            if let photos = photos {
                DispatchQueue.main.async {
                    self.userPhotos = photos

                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension SlidePhotosVC {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPhotos?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SlidePhotoItemCell else {
            return UICollectionViewCell()
        }
        if let photoName: String = userPhotos?[indexPath.item] {
            cell.photo = photoName
        }
        return cell
    }
}

extension SlidePhotosVC: UICollectionViewDelegateFlowLayout {
    // size items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.height / 2 - 10
        
        return .init(width: size, height: size)
    }
    
    // items spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 20, bottom: 0, right: 20)
    }
}

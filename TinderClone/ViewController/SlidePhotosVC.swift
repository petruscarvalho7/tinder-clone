//
//  SlidePhotosVC.swift
//  TinderClone
//
//  Created by Petrus Carvalho on 13/06/23.
//  Copyright © 2023 PETRUS CARVALHO. All rights reserved.
//

import UIKit
import Combine

class SlidePhotosVC: UICollectionViewController {
    
    private let slidePhotosViewModel: SlidePhotosViewModel = SlidePhotosViewModel()
    private var cancelables = Set<AnyCancellable>()
    
    let cellId = "cellId"
    
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
        
        setupBinders()
        getUserPhotos()
        setupViews()
    }
    
    func setupBinders() {
        slidePhotosViewModel.$userPhotos
            .receive(on: RunLoop.main)
            .sink { userPhotos in
                if !userPhotos.isEmpty {
                    self.collectionView.reloadData()
                }
            }
            .store(in: &cancelables)
    }
    
    fileprivate func setupViews() {
        collectionView.backgroundColor = .white
        
        collectionView.register(SlidePhotoItemCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    private func getUserPhotos() {
        slidePhotosViewModel.getUsersPhotos()
    }
}

extension SlidePhotosVC {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slidePhotosViewModel.userPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SlidePhotoItemCell else {
            return UICollectionViewCell()
        }
        if slidePhotosViewModel.userPhotos.count > indexPath.item
        {
            cell.photo = slidePhotosViewModel.userPhotos[indexPath.item]
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

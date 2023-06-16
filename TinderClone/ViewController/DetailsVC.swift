//
//  DetailsVC.swift
//  TinderClone
//
//  Created by PETRUS CARVALHO on 24/03/20.
//  Copyright © 2020 PETRUS CARVALHO. All rights reserved.
//

import UIKit
import Combine

class DetailsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let detailsViewModel: DetailsViewModel = DetailsViewModel()
    private var cancelables = Set<AnyCancellable>()
    
    // delegate
    var actionsDelegate: ActionsDelegate?
    
    let dislikeBtn: UIButton = .btnFooter("icone-dislike")
    let superlikeBtn: UIButton = .btnFooter("icone-superlike")
    let likeBtn: UIButton = .btnFooter("icone-like")
    let backBtn: UIButton = .btnBack()
    
    let cellId = "cellId"
    let headerId = "headerId"
    let profileDetails = "profileDetails"
    let photoDetails = "photoDetails"
     
    init() {
        super.init(collectionViewLayout: HeaderDetailLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinders()
        
        // removing safearea
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 134, right: 0)
        
        collectionView.backgroundColor = .clear
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        // register
        collectionView.register(DetailsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(DetailsProfileCell.self, forCellWithReuseIdentifier: profileDetails)
        collectionView.register(DetailsPhotosCell.self, forCellWithReuseIdentifier: photoDetails)
        
        // setup components
        setupBackButton()
        setupFooter()
    }
    
    func populate(_ user: User) {
        detailsViewModel.setUser(user)
    }
    
    func setupBinders() {
        detailsViewModel.$user
            .receive(on: RunLoop.main)
            .sink { user in
                self.collectionView.reloadData()
            }
            .store(in: &cancelables)
    }
    
    fileprivate func setupBackButton() {
        // get safearea on iphones with notch
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        let top = window?.safeAreaInsets.top ?? 44

        view.addSubview(backBtn)
        backBtn.fill(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            trailing: nil,
            bottom: nil,
            padding: UIEdgeInsets(
                top: top,
                left: 16,
                bottom: 0,
                right: 0
            )
        )
        
        backBtn.addTarget(self, action: #selector(onBack), for: .touchUpInside)
    }
    
    private func setupFooter() {
        let stackView = UIStackView(arrangedSubviews: [UIView(), dislikeBtn, superlikeBtn, likeBtn, UIView()])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.fill(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: UIEdgeInsets(
                top: 0,
                left: 16,
                bottom: 34,right: 16
            )
        )
        
        // button actions
        dislikeBtn.addTarget(self, action: #selector(onDislike), for: .touchUpInside)
        superlikeBtn.addTarget(self, action: #selector(onSuperLike), for: .touchUpInside)
        likeBtn.addTarget(self, action: #selector(onLike), for: .touchUpInside)
    }
    
    //header view configs
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DetailsHeaderView
        if let photoUser = self.detailsViewModel.user?.photo {
            headerCell.populate(photo: photoUser)
        }
        
        return headerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.height * 0.7)
    }
    
    
    //number of items
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileDetails, for: indexPath) as? DetailsProfileCell {
                populateDetailsProfileCell(cell)
                
                return cell
            }
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoDetails, for: indexPath) as? DetailsPhotosCell {
                return cell
            }
        default:
            return UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // set dynamic height for cells
        let width = UIScreen.main.bounds.width
        var height: CGFloat = UIScreen.main.bounds.width * 0.66
        
        var cell = UICollectionViewCell()
        
        if indexPath.item == 0 {
            cell = DetailsProfileCell(frame: CGRect(x: 0, y: 0, width: width, height: height)) 
            populateDetailsProfileCell(cell as? DetailsProfileCell)
            cell.layoutIfNeeded()
            
            // max estimate
            let estimateHeight = cell.systemLayoutSizeFitting(CGSize(width: width, height: 1000))
            height = estimateHeight.height
        }
        
        return .init(width: width, height: height)
    }
    
    fileprivate func populateDetailsProfileCell(_ cell: DetailsProfileCell?) {
        if let nameText = self.detailsViewModel.user?.name,
           let ageText = self.detailsViewModel.user?.age,
           let phraseText = self.detailsViewModel.user?.slogan {
            cell?.populateCell(
                name: nameText,
                age: String(ageText),
                phrase: phraseText
            )
        }
    }
}

// buttons actions
extension DetailsVC {
    @objc func onLike() {
        onBack()
        self.actionsDelegate?.like()
    }
    
    @objc func onDislike() {
        onBack()
        self.actionsDelegate?.dislike()
    }
    
    @objc func onSuperLike() {
        onBack()
        self.actionsDelegate?.superLike()
    }
    
    @objc func onBack() {
        self.dismiss(animated: true)
    }
}

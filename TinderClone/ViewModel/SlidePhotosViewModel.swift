//
//  SlidePhotosViewModel.swift
//  TinderClone
//
//  Created by Petrus Carvalho on 16/06/23.
//  Copyright © 2023 PETRUS CARVALHO. All rights reserved.
//

import Foundation
import Combine

class SlidePhotosViewModel {
    
    @Published private(set) var userPhotos: [String] = []
    
    private var apiService: UserService?
    
    init(apiService: UserService? = UserService.shared) {
        self.apiService = apiService
    }
    
    func getUsersPhotos() {
        apiService?.getUsersPhotos(completion: { [weak self] (userPhotos, err) in
            if let phots = userPhotos {
                self?.userPhotos = phots
            }
        })
    }
}

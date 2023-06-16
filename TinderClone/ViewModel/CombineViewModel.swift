//
//  CombineViewModel.swift
//  TinderClone
//
//  Created by Petrus Carvalho on 16/06/23.
//  Copyright © 2023 PETRUS CARVALHO. All rights reserved.
//

import Foundation
import Combine

class CombineViewModel {
    @Published private(set) var users: [User] = []
    
    private var apiService: UserService
    
    init(apiService: UserService = UserService.shared) {
        self.apiService = apiService
    }
    
    func getUsers() {
        apiService.getUsers { [weak self] (users, err) in
            if let usersData = users {
                self?.users = usersData
            }
        }
    }
    
    func removeCard(_ card: CombineCardView) {
        self.users = self.users.filter({ (user) -> Bool in
            return user.id != card.tag
        })
    }
}

//
//  MatchViewModel.swift
//  TinderClone
//
//  Created by Petrus Carvalho on 16/06/23.
//  Copyright © 2023 PETRUS CARVALHO. All rights reserved.
//

import Foundation
import Combine

class MatchViewModel {
    @Published private(set) var user: User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
    func setUser(_ user: User) {
        self.user = user
    }
}

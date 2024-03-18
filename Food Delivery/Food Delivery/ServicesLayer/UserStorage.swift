//
//  UserStorage.swift
//  Food Delivery
//
//  Created by Tanya on 10.03.2024.
//

import Foundation


class UserStorage {
    
    static let shared = UserStorage()
    
    var passedOnboarding: Bool {
        get { UserDefaults.standard.bool(forKey: "passedOnboarding") }
        set { UserDefaults.standard.set(newValue, forKey: "passedOnboarding") }
    }
    
}

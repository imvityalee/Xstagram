//
//  User.swift
//  Xstagram
//
//  Created by Victor Lee on 9/10/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: Codable {
    
    private static var _current: User?
    
    static var current: User {
        
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        return currentUser
        
    }
    
    let uid: String
    let username: String
    
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
        let username = dict["username"] as? String
            else {return nil}
        
        self.uid = snapshot.key
        self.username = username
        
    }
    
    static func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        if writeToUserDefaults {
            if let data = try? JSONEncoder().encode(user) {
                UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
            }
        }
        _current = user
    }
}


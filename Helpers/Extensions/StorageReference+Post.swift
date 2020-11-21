//
//  StorageReference+Post.swift
//  Xstagram
//
//  Created by Victor Lee on 11/18/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import FirebaseStorage


extension StorageReference {
    
    static let dateFormatter = ISO8601DateFormatter()
    
    static func newPostImageReference() -> StorageReference {
        let uid = User.current.uid
        let timestamp = dateFormatter.string(from: Date())
        
        return Storage.storage().reference().child("images/posts/\(uid)/\(timestamp).jpg")
        // Created a relative path to our storage in database 
    }
    
}

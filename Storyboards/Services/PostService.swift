//
//  PostService.swift
//  Xstagram
//
//  Created by Victor Lee on 10/31/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase


struct PostService {
    
    static func create(for image: UIImage) {
        let imageRef = StorageReference.newPostImageReference()
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
            let urlString = downloadURL.absoluteString
            let aspectHeight = image.aspectHeight
            Post.create(forURLString: urlString, aspectHeght: aspectHeight)
         
            
        }
    }
    
}

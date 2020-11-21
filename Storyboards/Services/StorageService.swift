//
//  StorageService.swift
//  Xstagram
//
//  Created by Victor Lee on 10/31/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation
import FirebaseStorage

struct StorageService {
    
    //method for uploading images
     
   static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {
            return completion(nil)
        }
        
        reference.putData(imageData, metadata: nil) { (metadate, error) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            reference.downloadURL { (url, error) in
                if let error = error {
                    assertionFailure(error.localizedDescription)
                    return completion(nil)
                }
                completion(url)
            }
        }
        
    }
}


//
//  MGPhotoHelper.swift
//  Xstagram
//
//  Created by Victor Lee on 10/10/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit

class MGPhotoHelper: NSObject {

    
    // properties
    
    var completionHandler: ((UIImage) -> Void)?
    
    
    // helper method
    
    func representActionSheet( from viewController: UIViewController) {
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
        // action sheet popsUp from the bottomOf the screen 
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { (action) in
                self.presentImagePickerController(with: .camera, from: viewController)
            })
            
            alertController.addAction(capturePhotoAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let uploadAction = UIAlertAction(title: "Upload from Libary", style: .default, handler: { (action) in
                self.presentImagePickerController(with: .photoLibrary, from: viewController)
            })
            alertController.addAction(uploadAction)
        }
        
        let cancleAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        alertController.addAction(cancleAction)
        
        viewController.present(alertController, animated: true)
    }
    
    
    func presentImagePickerController( with sourceType: UIImagePickerController.SourceType, from viewController: UIViewController ) {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        viewController.present(imagePickerController, animated: true)
        
    }
    
}

extension MGPhotoHelper: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey  : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            completionHandler?(selectedImage)
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

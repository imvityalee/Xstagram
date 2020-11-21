//
//  UIImage+Size.swift
//  Xstagram
//
//  Created by Victor Lee on 11/18/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit

extension UIImage {
    
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}

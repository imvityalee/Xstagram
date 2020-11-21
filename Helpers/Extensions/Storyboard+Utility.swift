//
//  Xstagram.swift
//  Xstagram
//
//  Created by Victor Lee on 9/24/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit


extension UIStoryboard {
    
    enum XGtype: String {
        case main
        case login
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(type: XGtype, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController(for type: XGtype) -> UIViewController {
        
        let storyboard = UIStoryboard(type: type)
        
        guard let initialViewController = storyboard.instantiateInitialViewController()  else {
            
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        return initialViewController
    }
 }








//
//  MainTabBarController.swift
//  Xstagram
//
//  Created by Victor Lee on 10/10/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
   let photoHelper = MGPhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoHelper.completionHandler = { image in
            PostService.create(for: image)
        }
        delegate = self
        tabBar.unselectedItemTintColor = .black
        // Do any additional setup after loading the view.
    }
    

}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController.tabBarItem.tag == 1 {
            photoHelper.representActionSheet(from: self)
            return false
        } else {
            return true
        }
    }
}

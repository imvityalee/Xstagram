//
//  CreateUsernameViewController.swift
//  Xstagram
//
//  Created by Victor Lee on 9/10/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class CreateUsernameViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        // 1 check if logged in and user provided username
        guard let firUser = Auth.auth().currentUser,
              let username = userNameTextField.text,
              !username.isEmpty else {return}
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {return}
            User.setCurrent(user, writeToUserDefaults: true)
            
            
            
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
            
        }
    }
    
    
    
}


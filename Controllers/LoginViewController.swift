//
//  LoginViewController.swift
//  Xstagram
//
//  Created by Victor on 8/24/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User
class LoginViewController: UIViewController {
    
    //       let user: FIRUser? = Auth.auth().currentUser
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        showLoginVC()
    }
    
    func showLoginVC() {
        
        guard let authUI = FUIAuth.defaultAuthUI() else {return}
        let providers = [FUIEmailAuth()] // email provider
        authUI.providers = providers
        let authViewController = authUI.authViewController() // shows viewcontroller
        self.present(authViewController, animated: true, completion: nil)
        authUI.delegate = self
        
    }
}



extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        if let error = error {
            assertionFailure("Error signin in \(error.localizedDescription)")
            return
        }
        
        guard let user = authDataResult?.user else {return} // проверяим зашел ли user
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                // handle existing user
                User.setCurrent(user, writeToUserDefaults: true)
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
                
            } else {
                // handle new user
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
        }
        
    }
}


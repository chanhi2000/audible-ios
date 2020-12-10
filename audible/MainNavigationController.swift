//
//  MainNavigationController.swift
//  audible
//
//  Created by LeeChan on 10/5/16.
//  Copyright © 2016 MarkiiimarK. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isLoggedIn() {
            let homeController = HomeViewController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return false
    }
    
    @objc
    func showLoginController() {
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: {
            // do something here
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    
}

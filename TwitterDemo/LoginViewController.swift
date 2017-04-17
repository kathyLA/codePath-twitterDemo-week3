//
//  ViewController.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/15/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit
import BDBOAuth1Manager
class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func login(_ sender: Any) {
        TwitterClient.shareInstance?.login(success: {
            print("I' ve  login")
            self.performSegue(withIdentifier:"loginSegure", sender: nil)
        }, failure: { (error) in
            print("login error \(error.localizedDescription)")
        })
    }
}


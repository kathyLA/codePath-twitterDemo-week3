//
//  TwitterClient.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit
import BDBOAuth1Manager
class TwitterClient: BDBOAuth1SessionManager {
    static let shareInstance = TwitterClient(baseURL: URL(string:"https://api.twitter.com"), consumerKey: "VK1Esx7qShdscNwBb0wOIBPm9", consumerSecret:"JvXrHKoifC4Uof1XM8bwuxuOjTSMyO2mT8T7BJAAt814cAwmxD")
  
    var loginSuccess:(() -> ())?
    var loginFailure:((_ error: Error) -> ())?
    
    func login(success: @escaping (() -> ()),failure: @escaping ((_ error: Error) -> ())) {
        loginSuccess = success
        loginFailure = failure
        
        fetchRequestToken(withPath: "oauth/request_token", method: "Get", callbackURL:
            URL(string:"DemoTwitterDev://oauth"), scope: nil, success: { (requestCrendential) in
            
            TwitterClient.shareInstance?.deauthorize()
            print("I got a token")
            
            if let requestToken = requestCrendential?.token {
                let url = URL(string:"https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken)")
                UIApplication.shared.open(url!, options:[:], completionHandler: nil)
            }
            else {
                print("there is an error happen")
            }
        }, failure: { (error) in
            print("error\(error?.localizedDescription)")
            self.loginFailure?(error!)
        })

    }
    
    func handleOpenUrl(url: URL) {
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        fetchAccessToken(withPath: "oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessCredential) in
            self.currentAccount(success: { (user: User) in
               User.currentUser = user
               self.loginSuccess?()
            }, failure: { (error) in
               self.loginFailure?(error)
            })
            
            
        }, failure: { (error) in
            print("Error happen")
            self.loginFailure?(error!)
        })
    }
    
    func homeTimeline(success: @escaping (([Tweet]) -> ()), failure: @escaping (Error) -> ()) {
        get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task, response) in
            let dictionaries = response as! [NSDictionary]
            let tweets = Tweet.tweetsWithArray(dictionaries: dictionaries)
            success(tweets)
        }, failure: { (task, error) in
            failure(error)
        })
    }
    
    func currentAccount(success: @escaping (User) -> (), failure: @escaping (Error) -> ()) {
        get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task, response) in
            
            let dictionary = response as! NSDictionary
            let user = User(dictionary: dictionary)
            success(user)
        }, failure: { (task, error) in
            failure(error)
        })

    }
    
    func logout() {
       NotificationCenter.default.post(name: NSNotification.Name(rawValue: User.userDidLogOutNotification), object: nil)
        
       deauthorize()
    }
}

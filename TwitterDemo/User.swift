//
//  User.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import Foundation

class User {
    var name: String?
    var screenName: String?
    var profileUrl: URL?
    var tagline: String?
    var favouritesCount: Int = 0
    var dictionary: NSDictionary?
    static let userDidLogOutNotification = "UserDidLogOut"
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = URL(string: profileUrlString)
        }
        tagline = dictionary["description"] as? String
        favouritesCount = dictionary["favourites_count"] as? Int ?? 0
    }
    
    static var _currentUser: User?
    class var currentUser: User? {
        get {
            if _currentUser  == nil {
                let defaults = UserDefaults.standard
                let userData = defaults.object(forKey: "currentUserData") as? Data
                if let userData = userData {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
           return _currentUser
        }
        set(user) {
            _currentUser = user
            
            let defaults = UserDefaults.standard
            if let user = user {
              let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
              defaults.set(data, forKey: "currentUserData")
            } else {
                 defaults.set(nil, forKey: "currentUserData")
            }
            
           
            defaults.synchronize()
        }
    }
}

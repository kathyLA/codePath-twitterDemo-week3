//
//  ProfileView.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/22/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    @IBOutlet weak var headerView: UIImageView!
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tweetsCount: UILabel!
    @IBOutlet weak var followingCounts: UILabel!
    @IBOutlet weak var followerCounts: UILabel!
    
    var user: User! {
            didSet {
            if let url = user.profileUrl {
                    profileView.setImageWith(url)
            }
                
            if let url = user.profileBackgroundUrl {
                    profileView.setImageWith(url)
            }
                
            name.text = user.name
            screenName.text = user.screenName
            followerCounts.text = "\(user.followerCount)"
            followingCounts.text = "\(user.followingCount)"
        }
    }
    //Set profile: () {}
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}

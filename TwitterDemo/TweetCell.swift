//
//  tweetCell.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit
import AFNetworking

class TweetCell: UITableViewCell {

    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var retweetUpperButton: UIButton!
    @IBOutlet weak var retweetUperLabel: UILabel!
    @IBOutlet weak var tweetUserNameLabel: UILabel!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tweet: Tweet! {
        didSet{
           let url = tweet.user?.profileUrl
            if let url = url {
                profileView.setImageWith(url)
            }
            
            retweetUpperButton.isHidden = true
            retweetUperLabel.isHidden = true
            tweetScreenNameLabel.text = "@" + (tweet.user?.screenName)!
            tweetUserNameLabel.text = tweet.user?.name
            tweetText.text = tweet.text
            timeLabel.text = tweet.time
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

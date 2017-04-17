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

    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var retweetUpperButton: UIButton!
    @IBOutlet weak var retweetUperLabel: UILabel!
    
    
    @IBOutlet weak var tweetUserNameLabel: UILabel!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
  
    @IBOutlet weak var reteetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tweet: Tweet! {
        didSet{
           let url = tweet.user?.profileUrl
            if let url = url {
                profileView.setImageWith(url)
            }
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

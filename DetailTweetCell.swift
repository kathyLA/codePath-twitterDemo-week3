//
//  DetailTweetCell.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit

class DetailTweetCell: UITableViewCell {
    @IBOutlet weak var retweetUpperButton: UIButton!
    @IBOutlet weak var retweetUpperLabel: UILabel!
    @IBOutlet weak var profileImageVIew: UIImageView!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var tweet: Tweet! {
        didSet {
              retweetUpperButton.isHidden = true
              retweetUpperLabel.isHidden = true
              let url = tweet.user?.profileUrl
              if let url = url {
                 profileImageVIew.setImageWith(url)
              }
              userName.text = tweet.user?.name
              screenName.text = tweet.user?.screenName
              tweetText.text = tweet.text
              dateLabel.text = tweet.timestampString
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

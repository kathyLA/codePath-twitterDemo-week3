//
//  tweetCell.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit
import AFNetworking

@objc protocol TweetCellButtonDelegate {
    @objc optional func didTapFavorite(tweetCell: TweetCell)
    @objc optional func didTapReplyTweet(tweetCell: TweetCell)
    @objc optional func didTapRetweet(tweetCell: TweetCell)
}

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
    weak var delegate: TweetCellButtonDelegate?
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
        let repleyImg = UIImage(named: "ic_reply")
        let retweetImg = UIImage(named: "ic_retweet")?.withRenderingMode(.alwaysTemplate)
        let favorite = UIImage(named: "ic_favorite")?.withRenderingMode(.alwaysTemplate)
        favoriteButton.setImage(favorite, for: .normal)
        retweetButton.setImage(retweetImg, for: .normal)
        shareButton.setImage(repleyImg, for: .normal)
        setUp()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setUp() {
        self.shareButton.addTarget(self, action: #selector(onRelpy), for: .touchUpInside)
        self.retweetButton.addTarget(self,action: #selector(onRetweet), for: .touchUpInside)
        self.favoriteButton.addTarget(self, action: #selector(onFavorite), for: .touchUpInside)
    }
    
    func onRelpy() {
        self.delegate?.didTapReplyTweet?(tweetCell: self)
        print("onReply")
    }

    func onRetweet() {
        print("onRetweet")
    }
    
    func onFavorite() {
        print("onFavorite")
    }
}

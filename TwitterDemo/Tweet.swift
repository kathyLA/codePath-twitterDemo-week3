//
//  Tweet.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import Foundation

class Tweet {
    var text: String?
    var timestamp: Date?
    var retweetCount: Int = 0
    var favouritesCount: Int = 0
    var user: User?
    var timestampString: String?
    var time: String?
    init (dictionary: NSDictionary) {
        let userDictionary = dictionary["user"] as! NSDictionary
        self.user = User(dictionary: userDictionary)
        text = dictionary["text"] as? String
        retweetCount = dictionary["retweet_count"] as? Int ?? 0
        favouritesCount = dictionary["favourites_count"] as? Int ?? 0
        let timestampString = dictionary["created_at"] as? String
        if let timestampString = timestampString {
            self.timestampString = timestampString
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.date(from: timestampString)
            var timeStr = ""
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: timestamp!)
            let minutes = calendar.component(.minute, from: timestamp!)
            let seconds = calendar.component(.second, from: timestamp!)
            let month = calendar.component(.month, from: timestamp!)
            let year = calendar.component(.year, from: timestamp!)
            if year > 0 {
                
            }
            
        }
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        return tweets
    }
}

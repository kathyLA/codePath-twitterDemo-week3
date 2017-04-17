//
//  ComposeTweetViewController.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit
import AFNetworking

@objc protocol ComposeTweetViewConrollerDelegate {
    @objc optional func didTweet(composeTweetViewController: ComposeTweetViewController);
}

class ComposeTweetViewController: UIViewController {
    
    @IBOutlet weak var replyUserLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var userScreenName: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    var user: User!
    var replyScreenName: String?
    var isReply: Bool?
    var replyId: NSNumber? 
    weak var delegate: ComposeTweetViewConrollerDelegate?
    
    @IBAction func tapTweet(_ sender: Any) {
        print("tweet")
        print("is Reply tweet: \(isReply)")
        let text = textView.text ?? ""
        if text != "" {
        let reply = isReply ?? false
            if(!reply) {
                TwitterClient.shareInstance?.newTweet(tweet: text , success: {
                    print("success tweet:\(text)")
                    self.delegate?.didTweet?(composeTweetViewController: self)
                }, failure: { (error) in
                    print("error when tweet:\(error.localizedDescription)")
                })
            } else {
                TwitterClient.shareInstance?.replyTweet(tweetText: text, id: replyId ?? 0, success: {
                    print("successful reply")
                }, failure: { (error) in
                    print("error when reply:\(error.localizedDescription)")
                })
                self.delegate?.didTweet?(composeTweetViewController: self)
            }
        }

    }


    @IBAction func cancelTweet(_ sender: Any) {
        print("cancel")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = user.profileUrl
        if let url = url {
            userImageView.setImageWith(url)
        } else {
            userImageView = nil
        }
        userName.text = user.name
        userScreenName.text = "@" + user.screenName!
        
        let reply = isReply ?? false
        if(reply) {
            self.textView.text = ""
            replyUserLabel.text = "reply to @" + replyScreenName!
        }
        self.replyUserLabel.isHidden = !reply
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

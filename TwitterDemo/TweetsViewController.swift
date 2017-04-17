//
//  TweetsViewController.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var tweets: [Tweet]!
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.tableview.estimatedRowHeight = 120
        self.tableview.rowHeight = UITableViewAutomaticDimension
        self.tableview.refreshControl = UIRefreshControl()
        self.tableview.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        refresh()
        // Do any additional setup after loading the view.
    }

    func refresh() {
        TwitterClient.shareInstance?.homeTimeline(success: { (tweets: [Tweet]) in
        self.tweets = tweets
            self.tableview.reloadData()
        }, failure: { (error) in
    
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onlogOut(_ sender: Any) {
        User.currentUser = nil
        TwitterClient.shareInstance?.logout()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  (tweets != nil) ? tweets.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tweet = self.tweets[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell") as! TweetCell
        cell.tweet = tweet
        return cell
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

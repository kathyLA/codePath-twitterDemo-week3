//
//  DetailTweetViewController.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit

class DetailTweetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tweet: Tweet?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifier = ""
        switch(indexPath.row) {
            case 0:
                identifier = "DetailTweetCell"
            case 1:
                identifier = "FavoritesAndRetweetsCountCell"
            case 2:
                identifier = "ButtonsCell"
            default:
             break
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        configureCell(cell: cell!, with: indexPath)
        return cell!
    }

    func configureCell(cell:UITableViewCell, with indexPath: IndexPath) {
        switch(indexPath.row) {
        case 0:
            let cell = cell as? DetailTweetCell
            cell?.tweet = tweet
        case 1:
            let cell = cell as? FavoritesAndRetweetsCountCell
            cell?.favoriteCount = tweet?.favouritesCount
            cell?.retweetCount = tweet?.retweetCount
        default:
            break
        }

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

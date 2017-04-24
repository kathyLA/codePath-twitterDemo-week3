//
//  MenuViewController.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/23/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit

//@objc protocol MenuViewControllerDelegate: class {
     //@objc optional func menuIcons() -> [UIImage]?
     //func menuTitles() -> [String]
     //func viewControllers() -> [UIViewController]
//}



class MenuViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    //weak var delegate: MenuViewControllerDelegate?
    var viewcontrollers: [UIViewController]!
    var hambugerViewController: HambugerViewController!
    var titles: [String]!
    var icons: [UIImage]?
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 45
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewcontrollers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        cell.menuLabel.text = titles[indexPath.row]
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        hambugerViewController.contentViewController = viewcontrollers[indexPath.row]
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

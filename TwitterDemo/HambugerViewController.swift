//
//  HambugerViewController.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/23/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit

class HambugerViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var contentViewLeadingConstrain: NSLayoutConstraint!
    
    var originalLeadingMargin: CGFloat!
    var menuViewController: UIViewController! {
        didSet {
            view.layoutIfNeeded()
            menuView.addSubview(menuViewController.view)
        }
    }

    var contentViewController: UIViewController! {
        didSet (oldContentViewController) {
            if(oldContentViewController != nil ) {
                oldContentViewController.willMove(toParentViewController: nil)
                oldContentViewController.removeFromParentViewController()
                oldContentViewController.didMove(toParentViewController: nil)
            }
            
            contentViewController.willMove(toParentViewController: self)
            contentView.addSubview(contentViewController.view)
            contentViewController.didMove(toParentViewController: self)
            
            UIView.animate(withDuration: 0.2) {
                self.contentViewLeadingConstrain.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPanContentView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        if(sender.state == .began) {
            originalLeadingMargin = contentViewLeadingConstrain.constant
            } else if (sender.state == .changed) {
                contentViewLeadingConstrain.constant = translation.x + originalLeadingMargin
            }
            else if (sender.state == .ended) {
            
                UIView.animate(withDuration: 0.2) {
                    if velocity.x > 0 {
                        self.contentViewLeadingConstrain.constant = (self.view.frame.size.width)/3
                    } else {
                        self.contentViewLeadingConstrain.constant = 0
                    }
                    self.view.layoutIfNeeded()
                }
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

//
//  ButtonsTableViewCell.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit

@objc protocol ButtonsCellDelegate {
    @objc optional func onTapReply()
    @objc optional func onTapRetweet()
    @objc optional func onTapFavorite()
}

class ButtonsCell: UITableViewCell {
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    weak var delegate: ButtonsCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        let retweetImg = UIImage(named: "ic_retweet")?.withRenderingMode(.alwaysTemplate)
        let favorite = UIImage(named: "ic_favorite")?.withRenderingMode(.alwaysTemplate)
        favoriteButton.setImage(favorite, for: .normal)
        retweetButton.setImage(retweetImg, for: .normal)
        
        shareButton.addTarget(self, action: #selector(tapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(tapRetweet), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(tapFavorite), for: .touchUpInside)
        // Initialization code
    }
    
    func tapReply() {
       delegate?.onTapReply?()
    }
    
    func tapFavorite() {
       delegate?.onTapFavorite?()
    }
    
    func tapRetweet() {
        delegate?.onTapRetweet?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

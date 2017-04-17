//
//  FavoritesAndRetweetsCountCell.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import UIKit

class FavoritesAndRetweetsCountCell: UITableViewCell {

    @IBOutlet weak var retweetLabel: UILabel!
    
    @IBOutlet weak var favoeiteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

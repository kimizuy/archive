//
//  itemTableViewCell.swift
//  MySearchApp
//
//  Created by Kimizu Yamasaki on 2016/03/26.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit

class itemTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

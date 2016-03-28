//
//  PhotoCell.swift
//  PhotoDiary
//
//  Created by Kimizu Yamasaki on 2016/03/26.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func prepareForReuse() {
        photoImageView.image = nil
        yearLabel.text = nil
        dayLabel.text = nil
    }
}

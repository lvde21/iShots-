
//
//  File.swift
//  iShots
//
//  Created by Lala Vaishno De on 5/30/15.
//  Copyright (c) 2015 Casa Wee. All rights reserved.
//

import Foundation
import UIKit

class ShotCell : UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
        
        titleLabel.textColor = UIColor(white: 0.45, alpha: 1.0)
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 14)
        
        coverImageView.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        coverImageView.layer.borderWidth = 0.5
        
        
    }
    
    
}
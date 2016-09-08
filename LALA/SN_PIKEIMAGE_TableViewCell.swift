//
//  SN_PIKEIMAGE_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/6.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class SN_PIKEIMAGE_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var UILabel_Main: UILabel!
    
    @IBOutlet weak var UIImageView1: UIImageView!
    @IBOutlet weak var UIImageView2: UIImageView!
    @IBOutlet weak var UIImageView3: UIImageView!
    
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

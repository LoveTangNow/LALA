//
//  TwoThreePhoto_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/7.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class TwoThreePhoto_TableViewCell: UITableViewCell {
    var imageid1:Int = 0
    var imageid2:Int = 0
    var imageid3:Int = 0
    
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

//
//  SevenEightNinePhoto_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/7.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class SevenEightNinePhoto_TableViewCell: UITableViewCell {
    var imageid1:Int = 0
    var imageid2:Int = 0
    var imageid3:Int = 0
    var imageid4:Int = 0
    var imageid5:Int = 0
    var imageid6:Int = 0
    var imageid7:Int = 0
    var imageid8:Int = 0
    var imageid9:Int = 0

    @IBOutlet weak var UIImageView_1: UIImageView!
    @IBOutlet weak var UIImageView_2: UIImageView!
    @IBOutlet weak var UIImageView_3: UIImageView!
    
    @IBOutlet weak var UIImageView_4: UIImageView!
    @IBOutlet weak var UIImageView_5: UIImageView!
    @IBOutlet weak var UIImageView_6: UIImageView!
    
    @IBOutlet weak var UIImageView_7: UIImageView!
    @IBOutlet weak var UIImageView_8: UIImageView!
    @IBOutlet weak var UIImageView_9: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

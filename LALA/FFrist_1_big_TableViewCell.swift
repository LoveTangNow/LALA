//
//  FFrist_1_big_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/11.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit



struct TableViewCell_1_big {
    let UIImageView_Top_Left:UIImage
    let UIImageView_Top_Right:UIImage
    let UIImageView_Main:UIImage
    let UIImageView_Bottom:UIImage

}

class FFrist_1_big_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var UIImageView_Top_Left: UIImageView!
    @IBOutlet weak var UIImageView_Top_Right: UIImageView!
    @IBOutlet weak var UIImageView_Mian: UIImageView!
    @IBOutlet weak var UIImageView_bottom: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

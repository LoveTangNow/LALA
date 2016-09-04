//
//  FFristTableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/10.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class FFrist23TableViewCell: UITableViewCell {
    
    @IBOutlet weak var image_left_top: UIImageView!
    @IBOutlet weak var image_right_top: UIImageView!
    
    @IBOutlet weak var UIImageView_Main1: UIImageView!
    @IBOutlet weak var UIImageView_Main2: UIImageView!
    @IBOutlet weak var UIImageView_Main3: UIImageView!
    
    @IBOutlet weak var UIImageView_BackGround: UIImageView!
    
    @IBOutlet weak var lable_sender: UILabel!
    @IBOutlet weak var UILabel_Time: UILabel!
    @IBOutlet weak var UILabel_Detail: UILabel!
    @IBOutlet weak var UILabel_Pinglun: UILabel!
    @IBOutlet weak var UILabel_Zan: UILabel!
    @IBOutlet weak var UILabel_Cai: UILabel!

    let Guding_Height = 80

    override func awakeFromNib() {
        image_left_top.layer.cornerRadius = image_left_top.frame.width / 2
        image_left_top.clipsToBounds = true
        
        image_right_top.layer.cornerRadius = image_right_top.frame.width / 6
        image_right_top.clipsToBounds = true
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

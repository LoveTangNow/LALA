//
//  FFrist456TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/11.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class FFrist456TableViewCell: UITableViewCell {
    
    @IBOutlet weak var Image_top_left: UIImageView!
    @IBOutlet weak var Image_top_right: UIImageView!
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    @IBOutlet weak var Image3: UIImageView!
    @IBOutlet weak var Image4: UIImageView!
    @IBOutlet weak var Image5: UIImageView!
    @IBOutlet weak var Image6: UIImageView!
    
    @IBOutlet weak var UIImageView_Background: UIImageView!
    
    @IBOutlet weak var Lable_sender: UILabel!
    @IBOutlet weak var Label_Time: UILabel!
    @IBOutlet weak var Lable_others: UILabel!
    
    @IBOutlet weak var UILabel_pinglun: UILabel!
    @IBOutlet weak var UILabel_zan: UILabel!
    @IBOutlet weak var UILabel_cai: UILabel!
    
    
    let Guding_Height = 80

    override func awakeFromNib() {
        
        Image_top_left.layer.cornerRadius = Image_top_left.frame.width / 2
        Image_top_left.clipsToBounds = true
        
        Image_top_right.layer.cornerRadius = Image_top_right.frame.width / 6
        Image_top_right.clipsToBounds = true
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

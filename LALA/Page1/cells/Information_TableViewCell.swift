//
//  Information_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/7.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class Information_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var UIImageView_UserIcon: UIImageView!
    @IBOutlet weak var UIImageView_Setting: UIImageView!
    
    @IBOutlet weak var UIImageView_Background: UIImageView!
    
    @IBOutlet weak var UILabel_SenderName: UILabel!
    @IBOutlet weak var UILabel_Information: UILabel!
    @IBOutlet weak var UILabel_MainDetail: UILabel!
    

    override func awakeFromNib() {
        UIImageView_UserIcon.layer.cornerRadius = UIImageView_UserIcon.frame.width / 2
        UIImageView_UserIcon.clipsToBounds = true
        
        UIImageView_Setting.layer.cornerRadius = UIImageView_Setting.frame.width / 6
        UIImageView_Setting.clipsToBounds = true
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

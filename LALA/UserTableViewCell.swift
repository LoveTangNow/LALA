//
//  UserTableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/5.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var UIImageView_UserIcon: UIImageView!
    
    @IBOutlet weak var UILabel_SenderName: UILabel!
    @IBOutlet weak var UILabel_News_Information: UILabel!
    @IBOutlet weak var UILabel_Detail: UILabel!
    
    let Guding_Height:CGFloat = 65
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  USER_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/7.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class USER_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var USER_ICON: UIButton!
    @IBOutlet weak var VIP: UIButton!
    
    @IBOutlet weak var UILabel_UserName: UILabel!
    @IBOutlet weak var UILabel_UserInformation: UILabel!
    
    @IBAction func User_ChangeIcon(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var User_Buy_VIP: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  SettingWithSwitchButtonTableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/12.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class SettingWithSwitchButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var UIImageView_Main: UIImageView!
    
    @IBOutlet weak var UILabel_Main: UILabel!
    
    @IBOutlet weak var UISwitch_Main: UISwitch!
    
    @IBAction func Switch_Click(sender: AnyObject) {
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

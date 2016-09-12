//
//  OneLabelOneSwitchTableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/12.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class OneLabelOneSwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var UILabel_M: UILabel!
    
    @IBOutlet weak var UISwitch_M: UISwitch!
    
    @IBAction func UISwitch_Click(sender: AnyObject) {
        print(UISwitch_M.on)
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

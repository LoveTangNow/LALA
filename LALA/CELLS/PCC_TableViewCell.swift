//
//  PCC_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/7.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class PCC_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var UILabel1: UILabel!
    @IBOutlet weak var UILabel2: UILabel!
    @IBOutlet weak var UILabel3: UILabel!
    
    @IBOutlet weak var UIButton1: UIButton!
    @IBOutlet weak var UIButton2: UIButton!
    @IBOutlet weak var UIButton3: UIButton!
    
    @IBAction func UIButton1_Click(sender: AnyObject) {
    }
    
    @IBAction func UIButton_Click(sender: AnyObject) {
    }
    
    @IBAction func UIButton3_Click(sender: AnyObject) {
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

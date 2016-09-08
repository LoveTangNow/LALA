//
//  Pinglun_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/5.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class Pinglun_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var UIImageView_SenderIcon: UIImageView!
    @IBOutlet weak var UIImageView_Zan: UIImageView!
    
    @IBOutlet weak var UILabel_SenderName: UILabel!
    @IBOutlet weak var UILabel_Pinglun_Information: UILabel!
    @IBOutlet weak var UILabel_Details: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

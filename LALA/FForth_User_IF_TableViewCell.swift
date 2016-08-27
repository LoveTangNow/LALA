//
//  FForth_User_IF_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/27.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class FForth_User_IF_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var User_Icon: UIImageView!
    @IBOutlet weak var User_VIP: UIImageView!
    
    @IBOutlet weak var USER_NAME: UILabel!
    @IBOutlet weak var USER_JIAN_JIE: UILabel!
    
    @IBOutlet weak var NEWS_NUMBERS: UILabel!
    @IBOutlet weak var NEWS_WORD: UILabel!
    
    @IBOutlet weak var Fouse_Number: UILabel!
    @IBOutlet weak var Focus_Word: UILabel!
    
    @IBOutlet weak var Fans_Number: UILabel!
    @IBOutlet weak var Fans_Word: UILabel!
    
    @IBOutlet weak var Space_Photo: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

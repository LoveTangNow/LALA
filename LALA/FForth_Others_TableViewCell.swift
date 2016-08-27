//
//  FForth_Others_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/27.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class FForth_Others_TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var Main_Image: UIImageView!
    @IBOutlet weak var Main_Word: UILabel!
    
    @IBOutlet weak var Miao_Shu_Word: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

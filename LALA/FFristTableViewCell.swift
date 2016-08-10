//
//  FFristTableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/10.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

struct video {
    let image_left_top: String
    let image_right_top: String
    let image_mid_left: String
    let image_mid_mid: String
    let image_mid_right: String
    let image_left_bottom: String
    let image_right_bottom: String
    let lable_sender: String
    let lable_time: String
    let lable_pinglun_number:String
    let lable_zan_number:String
    
}

class FFristTableViewCell: UITableViewCell {
    
    @IBOutlet weak var image_left_top: UIImageView!
    @IBOutlet weak var image_right_top: UIImageView!
    @IBOutlet weak var image_mid_left: UIImageView!
    @IBOutlet weak var image_mid_mid: UIImageView!
    @IBOutlet weak var image_mid_right: UIImageView!
    @IBOutlet weak var image_left_bottom: UIImageView!
    @IBOutlet weak var image_right_bottom: UIImageView!
    @IBOutlet weak var lable_sender: UILabel!
    @IBOutlet weak var lable_time: UILabel!
    @IBOutlet weak var lable_pinglun_number: UILabel!
    @IBOutlet weak var lable_zan_number: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

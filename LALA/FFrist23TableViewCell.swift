//
//  FFristTableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/10.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit



//Table的Cell控制文件
struct timecell {
    let style = "Suit_2_3_photos"
    var detail_height:Int = 0
    
    let height_without_detail = 5 + 30 + 5 + 5 + 90 + 5 + 30 + 5 + 20 + 5
    // 顶部间隔 + 第一行 + 间隔 + 具体文字? + 间隔 + 中央图片一行 + 间隔 + 评论行 + 间隔 +分界条 + 底部间隔
    
    
    let image_left_top: String
    let image_right_top: String
    
    let image_mid_left: String
    let image_mid_mid: String
    let image_mid_right: String
    
    let image_bottom: String
    
    let lable_sender: String
    let lable_time: String
}

class FFrist23TableViewCell: UITableViewCell {
    
    @IBOutlet weak var image_left_top: UIImageView!
    @IBOutlet weak var image_right_top: UIImageView!
    
    @IBOutlet weak var image_mid_left: UIImageView!
    @IBOutlet weak var image_mid_mid: UIImageView!
    @IBOutlet weak var image_mid_right: UIImageView!

    @IBOutlet weak var image_bottom: UIImageView!
    
    @IBOutlet weak var lable_sender: UILabel!
    @IBOutlet weak var lable_time: UILabel!
    
    var detail_height:Int = 0
    
    let height_without_detail = 5 + 30 + 5 + 5 + 90 + 5 + 30 + 5 + 20 + 5
    // 顶部间隔 + 第一行 + 间隔 + 具体文字? + 间隔 + 中央图片一行 + 间隔 + 评论行 + 间隔 +分界条 + 底部间隔
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

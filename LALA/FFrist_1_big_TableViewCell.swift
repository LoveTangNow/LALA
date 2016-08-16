//
//  FFrist_1_big_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/11.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit



struct TableViewCell_1_big {
    let style = "Suit_1_big_photos"
    var detail_height = 0
    
    
    let height_without_detail = 5 + 30 + 5 + 5 + 90 + 5 + 90 + 5 + 30 + 5 + 20 + 5
    // 顶部间隔 + 第一行 + 间隔 + 具体文字? + 间隔 + 中央图片一行 + 间隔 + 中央图片2行 + 间隔 + 评论行 + 间隔 +分界条 + 底部间隔
    
    let UIImageView_Top_Left:UIImage
    let UIImageView_Top_Right:UIImage
    let UIImageView_Main:UIImage
    let UIImageView_Bottom:UIImage

}

class FFrist_1_big_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var UIImageView_Top_Left: UIImageView!
    @IBOutlet weak var UIImageView_Top_Right: UIImageView!
    @IBOutlet weak var UIImageView_Mian: UIImageView!
    @IBOutlet weak var UIImageView_bottom: UIImageView!
    
    var detail_height = 0
    
    let height_without_detail = 5 + 30 + 5 + 5 + 90 + 5 + 90 + 5 + 30 + 5 + 20 + 5
    // 顶部间隔 + 第一行 + 间隔 + 具体文字? + 间隔 + 中央图片一行 + 间隔 + 中央图片2行 + 间隔 + 评论行 + 间隔 +分界条 + 底部间隔

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

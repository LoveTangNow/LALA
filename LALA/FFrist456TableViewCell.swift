//
//  FFrist456TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/11.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

struct a456TableViewCell
{
    let style = "Suit_4_5_6_photos"
    
    var detail_height = 0
    
    let height_without_detail = 5 + 30 + 5 + 5 + 90 + 5 + 90 + 5 + 30 + 5 + 20 + 5
    // 顶部间隔 + 第一行 + 间隔 + 具体文字? + 间隔 + 中央图片一行 + 间隔 + 中央图片2行 + 间隔 + 评论行 + 间隔 +分界条 + 底部间隔
    
    let Image_top_left:String
    let Image_top_right: String
    
    let Image1: String
    let Image2: String
    let Image3: String
    let Image4: String
    let Image5: String
    let Image6: String
    
    let Image_Bottom: String
    
    let Lable_sender: String
    let Lable_others: String
}


class FFrist456TableViewCell: UITableViewCell {
    
    @IBOutlet weak var Image_top_left: UIImageView!
    @IBOutlet weak var Image_top_right: UIImageView!
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    @IBOutlet weak var Image3: UIImageView!
    @IBOutlet weak var Image4: UIImageView!
    @IBOutlet weak var Image5: UIImageView!
    @IBOutlet weak var Image6: UIImageView!
    @IBOutlet weak var Image_Bottom: UIImageView!
    
    @IBOutlet weak var Lable_sender: UILabel!
    @IBOutlet weak var Lable_others: UILabel!
    
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

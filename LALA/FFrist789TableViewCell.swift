//
//  FFrist2TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/11.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
struct a789TableViewCell {
    let style = "Suit_1_big_photos"
    var detail_height = 0
    
    let height_without_detail = 5 + 30 + 5 + 5 + 90 + 5 + 90 + 5 + 90 + 5 + 30 + 5 + 20 + 5
    // 顶部间隔 + 第一行 + 间隔 + 具体文字? + 间隔 + 中央图片一行 + 间隔 + 中央图片2行 + 间隔 + 评论行 + 间隔 +分界条 + 底部间隔
    
    let UIImageView_Top_Left:UIImage
    let UIImageView_Top_Right:UIImage
    
    let UIImageView_Main1:UIImage
    let UIImageView_Main2:UIImage
    let UIImageView_Main3:UIImage
    let UIImageView_Main4:UIImage
    let UIImageView_Main5:UIImage
    let UIImageView_Main6:UIImage
    let UIImageView_Main7:UIImage
    let UIImageView_Main8:UIImage
    let UIImageView_Main9:UIImage
    
    let UIImageView_Bottom:UIImage
    
    let LableTOP:String = "haha"
    let LableMID:String = "哈哈"
    
}

class FFrist789TableViewCell: UITableViewCell {
    
    @IBOutlet weak var UIImageView_Top_Left: UIImageView!
    @IBOutlet weak var UIImageView_Top_Right: UIImageView!
    
    @IBOutlet weak var UIImageView_Main1: UIImageView!
    @IBOutlet weak var UIImageView_Main2: UIImageView!
    @IBOutlet weak var UIImageView_Main3: UIImageView!
    @IBOutlet weak var UIImageView_Main4: UIImageView!
    @IBOutlet weak var UIImageView_Main5: UIImageView!
    @IBOutlet weak var UIImageView_Main6: UIImageView!
    @IBOutlet weak var UIImageView_Main7: UIImageView!
    @IBOutlet weak var UIImageView_Main8: UIImageView!
    @IBOutlet weak var UIImageView_Main9: UIImageView!
    
    @IBOutlet weak var UIImageView_Bottom: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

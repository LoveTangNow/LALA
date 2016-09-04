//
//  FFrist_1_big_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/11.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//
import UIKit
import AVKit
import AVFoundation
import AlamofireImage
import Alamofire
import CoreData
import Foundation
import SwiftyJSON



struct TableViewCell_1_big {
    let style = "Suit_1_big_photos"
    var detail_height = 0
    
    
    let height_without_detail = 5 + 30 + 5 + 0 +  5 + 30 + 5 + 20 + 5
    // 顶部间隔 + 第一行 + 间隔 + 具体文字?  + 间隔 + 评论行 + 间隔 +分界条 + 底部间隔
    
    let UIImageView_Top_Left:UIImage
    let UIImageView_Top_Right:UIImage
    let UIImageView_Main:UIImage
    let UIImageView_Bottom:UIImage

}

class FFrist_1_big_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var UIImageView_Top_Left: UIImageView!
    @IBOutlet weak var UIImageView_Top_Right: UIImageView!
    @IBOutlet weak var UIImageView_Mian: UIImageView!
    
    @IBOutlet weak var UILabel_sender: UILabel!
    @IBOutlet weak var UILabel_Information: UILabel!
    @IBOutlet weak var UILabel_detail: UILabel!
    
    @IBOutlet weak var UILabel_Pinglun: UILabel!
    @IBOutlet weak var UILabel_Zan: UILabel!
    @IBOutlet weak var UILabel_Cai: UILabel!
    
    @IBOutlet weak var UIImageView_BackGround:UIImageView!
    
    @IBOutlet weak var ConteViewssssss: UIView!

    let Guding_Height = 80

    var Imageloads:Image = UIImage(named: "Black.png")!
    var ImageloadBackGroud:Image = UIImage(named: "FirstBackGround.png")!
    
    
    override func awakeFromNib() {
        
        UIImageView_Top_Left.layer.cornerRadius = UIImageView_Top_Left.frame.width / 2
        UIImageView_Top_Left.clipsToBounds = true
        
        UIImageView_Top_Right.layer.cornerRadius = UIImageView_Top_Right.frame.width / 6
        UIImageView_Top_Right.clipsToBounds = true
        
        //UIImageView_BackGround.image = ImageloadBackGroud

        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

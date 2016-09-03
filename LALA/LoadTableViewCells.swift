//
//  funccccccc.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/14.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import Foundation
import CoreData
import Alamofire
import AlamofireImage
import UIKit
import AVFoundation
import SwiftyJSON
import WebKit
import MBProgressHUD
import SwiftRecord

/*
 这是一个 tableview cell 各种砸入方法的一个类
 
 包括：
 第1页面
    没有图片
    单一图片
    2、3图片
    4、5、6图片
    7、8、9图片
 第四页面
    用户信息
    其他
 */



class LoadTableViewCells {
    
    func aaa (A:String) -> Int {
        return 1
    }
    
    func LoadOnePhoto(DataDetailIsEmpty:Bool,TableViewCell:FFrist_1_big_TableViewCell,Server:String,TableViewCellRow:NSIndexPath,TopLeftImage:UIImage,TopRightImage:UIImage,MainImages:String,MainImagei:UIImage,BottomImage:UIImage,Sender:String,SendTime:String,SendDevice:String,TableViewHeight:Int,WrodDetile:String)
    {
        switch DataDetailIsEmpty {
        case true://还未请求到数据
            break
        case false://请求到了数据
            //IMAGE
            TableViewCell.UIImageView_Top_Left.image = TopLeftImage
            TableViewCell.UIImageView_Top_Right.image = TopRightImage
            Alamofire.request(.GET, Server + MainImages)
                .responseImage { response in
                    if let imageg = response.result.value {
                        TableViewCell.UIImageView_Mian.image = MainImagei
                    }
            }
            TableViewCell.UIImageView_bottom.image = BottomImage
            //WORDS
            TableViewCell.UILabel_sender.text  = Sender
            TableViewCell.UILabel_detail.text =  WrodDetile
            
        }
    }
}

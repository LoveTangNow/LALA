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
import SwiftRecord
import SVProgressHUD

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
                        TableViewCell.UIImageView_Mian.image = imageg
                    }
            }
            //WORDS
            TableViewCell.UILabel_sender.text  = Sender
            TableViewCell.UILabel_detail.text =  WrodDetile
            
        }
    }
    
    
    //判断设备的方法
    func getDeviceVersion () -> String {
        let name = UnsafeMutablePointer<utsname>.alloc(1)
        uname(name)
        let machine = withUnsafePointer(&name.memory.machine, { (ptr) -> String? in
            
            let int8Ptr = unsafeBitCast(ptr, UnsafePointer<CChar>.self)
            return String.fromCString(int8Ptr)
        })
        name.dealloc(1)
        if let deviceString = machine {
            switch deviceString {
            //iPhone
            case "iPhone1,1":                return "iPhone 1G"
            case "iPhone1,2":                return "iPhone 3G"
            case "iPhone2,1":                return "iPhone 3GS"
            case "iPhone3,1", "iPhone3,2":   return "iPhone 4"
            case "iPhone4,1":                return "iPhone 4S"
            case "iPhone5,1", "iPhone5,2":   return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":   return "iPhone 5C"
            case "iPhone6,1", "iPhone6,2":   return "iPhone 5S"
            case "iPhone7,1":                return "iPhone 6 Plus"
            case "iPhone7,2":                return "iPhone 6"
            case "iPhone8,1":                return "iPhone 6s"
            case "iPhone8,2":                return "iPhone 6s Plus"
            case "iPhone8,3":                return "iPhone SE"
            default:
                return deviceString
            }
        } else {
            return "Unknown"
        }
    }
    
    //计算需要高度的方法
    func Height_Work(Words:String,Width:CGFloat) -> Int {
        /*
         320
         375.5
         414
         */
        switch Width {
        case 320:
            //每行20
            return ((Words.characters.count - Words.characters.count % 20) / 20 + 1) * 15 + 15
        case 375.5:
            //每行24
            return ((Words.characters.count - Words.characters.count % 24) / 24 + 1) * 15 + 15
        case 414:
            //每行27
            return ((Words.characters.count - Words.characters.count % 27) / 27 + 1) * 15 + 15
        default:
            return 24
        }
    }
   
}

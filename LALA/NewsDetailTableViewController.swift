//
//  NewsDetailTableViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/5.
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

class NewsDetailTableViewController: UITableViewController {

    var newsid:String = ""
    var newstime:String = ""
    var device:String = ""
    var sendername:String = ""
    var detail:String = ""
    var photonumber:Int = 0
    
    
    var Tableviewcell_Height:CGFloat = 0
    var Device_Width:CGFloat = 0
    
    var Imageload:Image = UIImage(named: "Black.png")!
    
    // MARK: - FUNCS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsid = NSUserDefaults.standardUserDefaults().valueForKey("newsid") as! String
        newstime = NSUserDefaults.standardUserDefaults().valueForKey("newstime") as! String
        device = NSUserDefaults.standardUserDefaults().valueForKey("device") as! String
        sendername = NSUserDefaults.standardUserDefaults().valueForKey("sendername") as! String
        detail = NSUserDefaults.standardUserDefaults().valueForKey("detail") as! String
        photonumber = NSUserDefaults.standardUserDefaults().valueForKey("photonumber") as! Int
        
        Device_Width = UIScreen.mainScreen().bounds.width
        
        /*
         用户 id senderid
         用户 昵称  sendername
         消息的 时间 设备 senddevice
         消息的 长文字 detail
         消息的图片 缓存信息  ?????
         
         根据用户 id 去查询 评论   ????
         */
        //得到用户 信息 之后呢 发起网络请求那就呗
        /*
         320
         375.5
         414
         */
        print(Device_Width)
        print(LoadTableViewCells().Height_Work("你好LALA", Width:Device_Width))
        print(LoadTableViewCells().getDeviceVersion())
        
        self.title = "消息"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    //TableView中有几个Sections
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
        /*
         1、动态
            1、上部分
            2、图片部分
         2、广告
         3、评论
         */
    }
    
    //Section中有几行 tableview
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 10
        }
    }
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 10
        case 1:
            return 10
        default:
            return 0
        }
    }
    
    
    //cell的初始化都在这里了 返回 一个cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
         1、动态
         1、上部分
         2、图片部分
         2、广告
         3、评论
         */
        if indexPath.section == 0 && indexPath.row == 0  {
            let cell = tableView.dequeueReusableCellWithIdentifier("UserTableViewCell", forIndexPath: indexPath) as! UserTableViewCell
            cell.UILabel_SenderName.text = sendername
            cell.UILabel_Detail.text = detail
            cell.UILabel_News_Information.text = newstime + " " + device
            // Configure the cell...
            /*
             判断设备
             根据 detail 文字的个数来计算需要的高度
                固定高度 和 非固定的 lable 的高度
             */
            
            Tableviewcell_Height = cell.Guding_Height + CGFloat(LoadTableViewCells().Height_Work(detail, Width: UIScreen.mainScreen().bounds.width))
            
            return cell

        }
        
        if indexPath.section == 0 && indexPath.row == 1  {
            //图片部分咯~~~
            switch photonumber {
            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("One_Photo_TableViewCell", forIndexPath: indexPath) as! One_Photo_TableViewCell
                
                cell.UIImageView_Main.image = Imageload
                
                Tableviewcell_Height = (UIScreen.mainScreen().bounds.width + 5) * 0.618
                
                return cell
                
            case 2,3:
                let cell = tableView.dequeueReusableCellWithIdentifier("Two_Three_TableViewCell", forIndexPath: indexPath) as! Two_Three_TableViewCell
                
                cell.UIImageView1.image = Imageload
                cell.UIImageView2.image = Imageload
                cell.UIImageView3.image = Imageload
                
                Tableviewcell_Height = (UIScreen.mainScreen().bounds.width + 5) / 3
                
                return cell
                
            case 4,5,6:
                let cell = tableView.dequeueReusableCellWithIdentifier("Four_Five_Six_TableViewCell", forIndexPath: indexPath) as! Four_Five_Six_TableViewCell
                
                cell.UIImageView1.image = Imageload
                cell.UIImageView2.image = Imageload
                cell.UIImageView3.image = Imageload
                cell.UIImageView4.image = Imageload
                cell.UIImageView5.image = Imageload
                cell.UIImageView6.image = Imageload
                
                Tableviewcell_Height = (UIScreen.mainScreen().bounds.width + 5) / 3 * 2
                
                return cell
                
            case 7,8,9:
                let cell = tableView.dequeueReusableCellWithIdentifier("Seven_Eight_Nine_TableViewCell", forIndexPath: indexPath) as! Seven_Eight_Nine_TableViewCell
                
                cell.UIImageView1.image = Imageload
                cell.UIImageView2.image = Imageload
                cell.UIImageView3.image = Imageload
                cell.UIImageView4.image = Imageload
                cell.UIImageView5.image = Imageload
                cell.UIImageView6.image = Imageload
                cell.UIImageView7.image = Imageload
                cell.UIImageView8.image = Imageload
                cell.UIImageView9.image = Imageload
                
                Tableviewcell_Height = UIScreen.mainScreen().bounds.width + 5
                
                return cell
                
            default:
                let cell = tableView.dequeueReusableCellWithIdentifier("One_Photo_TableViewCell", forIndexPath: indexPath) as! One_Photo_TableViewCell
                return cell
            }
        }
        
        if indexPath.section == 1 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ADS_TableViewCell", forIndexPath: indexPath) as! ADS_TableViewCell
            
            cell.UIImageView_Main.image = Imageload
            
            Tableviewcell_Height = UIScreen.mainScreen().bounds.width / 5
            
            return cell
        }
        
        if indexPath.section == 2 {
            //评论部分Pinglun_TableViewCell
            let cell = tableView.dequeueReusableCellWithIdentifier("Pinglun_TableViewCell", forIndexPath: indexPath) as! Pinglun_TableViewCell
            cell.UIImageView_SenderIcon.image = Imageload
            //cell.UIImageView_Zan.image = Imageload
            
            cell.UILabel_SenderName.text = "某某某"
            cell.UILabel_Pinglun_Information.text = "某某某时间？"
            cell.UILabel_Details.text = "你是我的小呀小苹果，怎么爱你都不嫌多。1你是我的小呀小苹果，怎么爱你都不嫌多。2你是我的小呀小苹果，怎么爱你都不嫌多。3你是我的小呀小苹果，怎么爱你都不嫌多。4你是我的小呀小苹果，怎么爱你都不嫌多。5你是我的小呀小苹果，怎么爱你都不嫌多。6你是我的小呀小苹果，怎么爱你都不嫌多。7你都不"
            
            Tableviewcell_Height = CGFloat(LoadTableViewCells().Height_Work(cell.UILabel_Details.text!, Width: UIScreen.mainScreen().bounds.width)) + 75
    
            return cell
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UserTableViewCell", forIndexPath: indexPath) as! UserTableViewCell
        // Configure the cell...
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        //print("Tableview cell高度")
        return Tableviewcell_Height
    }

}

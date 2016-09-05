//
//  NewsDetailTableViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/5.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class NewsDetailTableViewController: UITableViewController {

    var newsid:String = ""
    var newstime:String = ""
    var device:String = ""
    var sendername:String = ""
    var detail:String = ""
    
    var Tableviewcell_Height:CGFloat = 0
    var Device_Width:CGFloat = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsid = NSUserDefaults.standardUserDefaults().valueForKey("newsid") as! String
        newstime = NSUserDefaults.standardUserDefaults().valueForKey("newstime") as! String
        device = NSUserDefaults.standardUserDefaults().valueForKey("device") as! String
        sendername = NSUserDefaults.standardUserDefaults().valueForKey("sendername") as! String
        detail = NSUserDefaults.standardUserDefaults().valueForKey("detail") as! String
        
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
        if section == 0 {
            //动态
            return 2
        }
        if section == 1 {
            //广告
            return 1
        }
        else{
            //评论
            return 10
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

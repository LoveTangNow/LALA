//
//  Send_News_TableViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/5.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class Send_News_TableViewController: UITableViewController {
    
    // MARK: - BIAN LIANG
    
    var TableViewCell_Height:CGFloat = 0
    
    var Imageload:Image = UIImage(named: "Black.png")!
    
    // MARK: - FUNCS

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func UIButton_TOPRIGHT_Click(sender: AnyObject) {
        print("a")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    //TableView中有几个Sections
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    //Section中有几行 tableview
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    
    //cell的初始化都在这里了 返回 一个cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /*
         1、
            1、文字框
            2、图片选择
         2、
            1、地点
            2、分享
         */
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                //文字框
                let cell = tableView.dequeueReusableCellWithIdentifier("SN_WORDS_TableViewCell", forIndexPath: indexPath) as! SN_WORDS_TableViewCell
                // Configure the cell...
                
                TableViewCell_Height = 200
                
                return cell
            }
            else{
                //图片选择
                let cell = tableView.dequeueReusableCellWithIdentifier("SN_PIKEIMAGE_TableViewCell", forIndexPath: indexPath) as! SN_PIKEIMAGE_TableViewCell
                // Configure the cell...
                
                cell.UIImageView1.image = Imageload
                cell.UIImageView2.image = Imageload
                cell.UIImageView3.image = Imageload
                
                TableViewCell_Height = UIScreen.mainScreen().bounds.width / 3 + 42
                
                return cell
            }
        }
        else{
            if indexPath.row == 0 {
                //选取地点
                let cell = tableView.dequeueReusableCellWithIdentifier("SN_PIKELOCA_TableViewCell", forIndexPath: indexPath) as! SN_PIKELOCA_TableViewCell
                // Configure the cell...
                
                TableViewCell_Height = 44
                
                return cell
            }
            else{
                //分享
                let cell = tableView.dequeueReusableCellWithIdentifier("SN_SHARE_TableViewCell", forIndexPath: indexPath) as! SN_SHARE_TableViewCell
                // Configure the cell...
                
                cell.UIImageView1.image = Imageload
                
                TableViewCell_Height = 60
                
                return cell
            }
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        //print("Tableview cell高度")
        return TableViewCell_Height
    }
}

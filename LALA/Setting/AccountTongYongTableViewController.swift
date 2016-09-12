//
//  AccountTongYongTableViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/12.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class AccountTongYongTableViewController: UITableViewController {
    
    /*
     图片模式
        无图 小图 自适应
     视频
        任何情况下不自动播放视频    WiFi 自动播放  移动网络播放提醒 移动网络自动播放
     声音
        按钮声音开关
     语言
        多语言系统
     */
    
    var SettingList_pho = ["图片浏览设置","视频播放设置"]
    var SettingList_pho2 = ["自适应","移动网络播放提醒"]
    var SettingList_voi = ["按钮声音"]
    var SettingList_lan = ["语言系统"]
    
    @IBOutlet var UITableView_M: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "通用设置"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0,1:
            return 10
        default:
            return 0
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section  {
        case 0:
            return SettingList_pho.count
        case 1:
            return SettingList_voi.count
        case 2:
            return SettingList_lan.count
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0://图片 视频
            let cell = tableView.dequeueReusableCellWithIdentifier("TwoLabelTableViewCell", forIndexPath: indexPath) as! TwoLabelTableViewCell
            cell.UILabel_Left.text = SettingList_pho[indexPath.row]
            cell.UILabel_Right.text = SettingList_pho2[indexPath.row]
            return cell
        case 1://声音
            let cell = tableView.dequeueReusableCellWithIdentifier("OneLabelOneSwitchTableViewCell", forIndexPath: indexPath) as! OneLabelOneSwitchTableViewCell
            cell.UILabel_M.text = SettingList_voi[indexPath.row]
            cell.UISwitch_M.on = true
            return cell
        default://语言
            let cell = tableView.dequeueReusableCellWithIdentifier("TwoLabelTableViewCell", forIndexPath: indexPath) as! TwoLabelTableViewCell
            cell.UILabel_Left.text = SettingList_lan[indexPath.row]
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        /*
         图片模式
         无图 小图 自适应
         视频
         任何情况下不自动播放视频    WiFi 自动播放  移动网络播放提醒 移动网络自动播放
         声音
         按钮声音开关
         语言
         多语言系统
         */
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let actionSheetController: UIAlertController = UIAlertController(title: "请选择", message:nil, preferredStyle: .ActionSheet)
                
                //取消按钮
                let Cancel: UIAlertAction = UIAlertAction(title: "取消", style: .Cancel) { action -> Void in
                    //Just dismiss the action sheet
                }
                //拍照
                let AutoPhoto: UIAlertAction = UIAlertAction(title: "图片自适应", style: .Default){ action -> Void in
                    self.SettingList_pho2[0] = "图片自适应"
                    self.UITableView_M.reloadData()
                }
                //拍照
                let BigPhoto: UIAlertAction = UIAlertAction(title: "大图模式", style: .Default){ action -> Void in
                    self.SettingList_pho2[0] =  "大图模式"
                    self.UITableView_M.reloadData()
                }
                //相册选择
                let SmallPhoto: UIAlertAction = UIAlertAction(title: "小图模式", style: .Default){ action -> Void in
                    self.SettingList_pho2[0] =  "小图模式"
                    self.UITableView_M.reloadData()
                }
                
                actionSheetController.addAction(Cancel)
                actionSheetController.addAction(AutoPhoto)
                actionSheetController.addAction(BigPhoto)
                actionSheetController.addAction(SmallPhoto)
                
                self.presentViewController(actionSheetController, animated: true, completion: nil)
            default:
                let actionSheetController: UIAlertController = UIAlertController(title: "请选择", message:nil, preferredStyle: .ActionSheet)
                
                //取消按钮
                let cancelAction: UIAlertAction = UIAlertAction(title: "取消", style: .Cancel) { action -> Void in

                }
                //拍照
                let takePictureAction1: UIAlertAction = UIAlertAction(title: "任何情况下不自动播放视频", style: .Default){ action -> Void in
                    self.SettingList_pho2[1] =  "任何情况下不自动播放视频"
                    self.UITableView_M.reloadData()
                }
                //拍照
                let takePictureAction: UIAlertAction = UIAlertAction(title: " WiFi 自动播放视频", style: .Default){ action -> Void in
                    self.SettingList_pho2[1] =  " WiFi 自动播放视频"
                    self.UITableView_M.reloadData()
                }
                //相册选择
                let choosePictureAction: UIAlertAction = UIAlertAction(title: "移动网络播放提醒", style: .Default){ action -> Void in
                   self.SettingList_pho2[1] =  "移动网络播放提醒"
                    self.UITableView_M.reloadData()
                }
                //摄像
                let moviePictureAction: UIAlertAction = UIAlertAction(title: "移动网络自动播放", style: .Default){ action -> Void in
                    self.SettingList_pho2[1] =  "移动网络自动播放"
                    self.UITableView_M.reloadData()
                }
                
                actionSheetController.addAction(cancelAction)
                actionSheetController.addAction(takePictureAction)
                actionSheetController.addAction(takePictureAction1)
                actionSheetController.addAction(choosePictureAction)
                actionSheetController.addAction(moviePictureAction)
                
                self.presentViewController(actionSheetController, animated: true, completion: nil)
            }
        default:
            break
        }
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

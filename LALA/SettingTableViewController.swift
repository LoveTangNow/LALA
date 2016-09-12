//
//  SettingTableViewController.swift
//  Link_Now
//
//  Created by Thomas Liu on 16/8/8.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire


//设置页面
class SettingTableViewController: UITableViewController {
    let SettingList1 = ["账号管理","账号安全"]
    let SettingList2 = ["通知","通用设置"]
    let SettingList3 = ["缓存清理","意见反馈","关于 LALA"]
    
    var Imageload:Image = UIImage(named: "Black.png")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "设置"
        //去除尾部多余的空行
        self.tableView.tableFooterView = UIView(frame:CGRectZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 0://1
            switch indexPath.row {
            case 0://账号
                let vc = UIStoryboard(name: "Setting", bundle: nil).instantiateViewControllerWithIdentifier("AccountTableViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0://通知
                break
            case 1://通用
                let vc = UIStoryboard(name: "Setting", bundle: nil).instantiateViewControllerWithIdentifier("AccountTongYongTableViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        default:
            break
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1,2,3:
            return 10
        default:
            return 0
        }
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return SettingList1.count
        case 1:
            return SettingList2.count
        case 2:
            return SettingList3.count
        case 3:
            return 1
        default:
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("SettingWithoutSwitchButtonTableViewCell", forIndexPath: indexPath) as! SettingWithoutSwitchButtonTableViewCell
            
            cell.UIImageView_Main.image = Imageload
            cell.UILabel_Main.text = SettingList1[indexPath.row]
            
            // Configure the cell...
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("SettingWithoutSwitchButtonTableViewCell", forIndexPath: indexPath) as! SettingWithoutSwitchButtonTableViewCell
            
            cell.UIImageView_Main.image = Imageload
            cell.UILabel_Main.text = SettingList2[indexPath.row]

            // Configure the cell...
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("SettingWithoutSwitchButtonTableViewCell", forIndexPath: indexPath) as! SettingWithoutSwitchButtonTableViewCell
            
            cell.UIImageView_Main.image = Imageload
            cell.UILabel_Main.text = SettingList3[indexPath.row]

            // Configure the cell...
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("OnlyLabelTableViewCell", forIndexPath: indexPath) as! OnlyLabelTableViewCell
            // Configure the cell...
            
            cell.UILabel_Main.text = "退出当前账号"
            
            return cell
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

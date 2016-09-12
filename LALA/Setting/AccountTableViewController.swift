//
//  AccountTableViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/12.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController {
    /*
     账号：
        头像  昵称  生日  性别  所在地
     简介：
        ??
     教育信息
        小学  中学 *2   大学  研究生 研究生以上
     绑定：
        ？？
     其他
        勋章  等级  注册时间
     */
    
    let AccountSettingList_Main = ["头像","昵称","生日","性别","所在地"]
    let AccountSettingList_Jianjie = ["简介"]
    let AccountSettingList_Edu = ["小学","初中","高中","大学","研究生","研究生以上"]
    let AccountSettingList_Bangding = ["绑定手机号","绑定邮箱","绑定微博","绑定微信","绑定支付宝","绑定QQ"]
    let AccountSettingList_Others = ["勋章","等级","注册时间",]
    
    var TableView_Height:CGFloat = 0
    


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0 {
            return 30
        } else {
            return 0
        }
    }
    
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0://常规
//            return ""
//        case 1://简介
//            return ""
//        case 2://教育
//            return "教育情况"
//        case 3://绑定
//            return "绑定其它账号"
//        case 4://其他
//            return ""
//        default:
//            return ""
//        }
//    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return TableView_Height
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return AccountSettingList_Main.count
        case 1:
            return AccountSettingList_Jianjie.count
        case 2:
            return AccountSettingList_Edu.count
        case 3:
            return AccountSettingList_Bangding.count
        case 4:
            return AccountSettingList_Others.count
        default:
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("AImageAndALabelTableViewCell", forIndexPath: indexPath) as! AImageAndALabelTableViewCell
                cell.UILabel_Main.text = AccountSettingList_Main[indexPath.row]
                TableView_Height = 90
                return cell
            default:
                let cell = tableView.dequeueReusableCellWithIdentifier("TwoLabelTableViewCell", forIndexPath: indexPath) as! TwoLabelTableViewCell
                cell.UILabel_Left.text = AccountSettingList_Main[indexPath.row]
                TableView_Height = 40
                return cell
            }
        case 1://jianjie
            let cell = tableView.dequeueReusableCellWithIdentifier("TwoLabelButOneOfThenReallyBigTableViewCell", forIndexPath: indexPath) as! TwoLabelButOneOfThenReallyBigTableViewCell
            cell.UILabel_Left.text = AccountSettingList_Jianjie[indexPath.row]
            
            //计算文字行数
            TableView_Height = 70
            
            return cell
        case 2:// edu
            let cell = tableView.dequeueReusableCellWithIdentifier("TwoLabelTableViewCell", forIndexPath: indexPath) as! TwoLabelTableViewCell
            
            cell.UILabel_Left.text = AccountSettingList_Edu[indexPath.row]
            
            TableView_Height = 40
            
            return cell
        case 3:// bangding
            let cell = tableView.dequeueReusableCellWithIdentifier("AImageAndALabelTableViewCell", forIndexPath: indexPath) as! AImageAndALabelTableViewCell
            
            cell.UILabel_Main.text = AccountSettingList_Bangding[indexPath.row]
            
            TableView_Height = 40
            return cell
        default:// others
            let cell = tableView.dequeueReusableCellWithIdentifier("TwoLabelTableViewCell", forIndexPath: indexPath) as! TwoLabelTableViewCell
            
            cell.UILabel_Left.text = AccountSettingList_Others[indexPath.row]
            
            TableView_Height = 40
            
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

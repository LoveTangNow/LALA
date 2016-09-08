//
//  FForthTableViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/7.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class FForthTableViewController: UITableViewController {
    
    //MARK: - BIAN LIANG
    
    var Tableview_Height:CGFloat = 0
    
    var list = [
        "我的相册",
        "我的评论",
        "我的赞",
        "更多"]
    var list_Numbers = [Int]()
    
    var list_ = ["ha":"ha","hei":"","jie":"aaaaaaa","vip":true]
    
    
    
    //MARK: - FUNC

    override func viewDidLoad() {
        
        //获取到本人所有的 “动态总数” - “被赞总数” - “朋友总数”
        Alamofire.request(.GET, "", parameters: ["Userid":10])
        
        //获取到本人的“用户头像” - “用户昵称” - “用户介绍” - “是否 VIP”
        print(list_["jie"])
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 2
        } else {
            return list.count
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Tableview_Height
    }
    
    //cell的初始化都在这里了 返回 一个cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0  {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("USER_TableViewCell", forIndexPath: indexPath) as! USER_TableViewCell
                // Configure the cell...
                
                Tableview_Height = 90
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("PCC_TableViewCell", forIndexPath: indexPath) as! PCC_TableViewCell
                // Configure the cell...
                
                Tableview_Height = 65
                
                return cell
            }
        } else {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("USER_OTHERS_TableViewCell", forIndexPath: indexPath) as! USER_OTHERS_TableViewCell
            // Configure the cell...
            
            cell.UILabel_Main.text = list[indexPath.row]
            
            Tableview_Height = 50
            
            return cell
        }
    }
    
    //
    //    override func viewDidAppear(animated: Bool) {
    //
    //        navigationController?.navigationBar.translucent = false
    //        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    //        navigationController?.navigationBar.shadowImage = UIImage()
    //        navigationController?.navigationBar.barTintColor = UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0)
    //
    //        // Initialize tableView
    //        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
    //        loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
    //        MainTableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
    //            // Add your logic here
    //            self!.MainTableView.reloadData()
    //            // Do not forget to call dg_stopLoading() at the end
    //            self?.MainTableView.dg_stopLoading()
    //            }, loadingView: loadingView)
    //        MainTableView.dg_setPullToRefreshFillColor(UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0))
    //        MainTableView.dg_setPullToRefreshBackgroundColor(MainTableView.backgroundColor!)
    //
    //    }
    //
    //    deinit {
    //        MainTableView.dg_removePullToRefresh()
    //    }

}

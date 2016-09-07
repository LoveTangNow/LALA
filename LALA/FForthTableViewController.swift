//
//  FForthTableViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/7.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class FForthTableViewController: UITableViewController {
    
    //MARK: - BIAN LIANG
    
    var Tableview_Height:CGFloat = 0
    
    
    //MARK: - FUNC

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
            return 10
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
                
                Tableview_Height = 100
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("PCC_TableViewCell", forIndexPath: indexPath) as! PCC_TableViewCell
                // Configure the cell...
                
                Tableview_Height = 100
                
                return cell
            }
        } else {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("USER_OTHERS_TableViewCell", forIndexPath: indexPath) as! USER_OTHERS_TableViewCell
            // Configure the cell...
            
            Tableview_Height = 50
            
            return cell
        }
    }

}

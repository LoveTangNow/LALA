//
//  Send_News_TableViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/5.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class Send_News_TableViewController: UITableViewController {
    
    // MARK: - BIAN LIANG
    
    var TableViewCell_Height:CGFloat = 0
    
    
    // MARK: - FUNCS

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return 0
    }
    
    //Section中有几行 tableview
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    //cell的初始化都在这里了 返回 一个cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        // Configure the cell...
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        //print("Tableview cell高度")
        return TableViewCell_Height
    }
}

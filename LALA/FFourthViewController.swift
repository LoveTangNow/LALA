//
//  FFourthViewController.swift
//  Link_Now
//
//  Created by Thomas Liu on 16/8/7.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit


class ZYFruit: NSObject {
    var name: String = String ()
    var desc: String = String ()
    var fruit: NSArray = NSArray ()
}


class FFourthViewController: UIViewController, UITableViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBOutlet weak var aTableView: UITableView!
    
    lazy var dataList: NSArray = {
        
        
        var zyFriut1: ZYFruit = ZYFruit()
        zyFriut1.name = "第一筐水果"
        zyFriut1.desc = "多汁"
        var list: NSMutableArray = NSMutableArray ()
        for index: Int in 0 ..< 10 {
            list .addObject("\(zyFriut1.name) - " + "\(index)")
        }
        zyFriut1.fruit = list
        
        
        var zyFriut2: ZYFruit = ZYFruit()
        zyFriut2.name = "第二筐水果"
        zyFriut2.desc = "好吃"
        var list2: NSMutableArray = NSMutableArray ()
        for index: Int in 0 ..< 20 {
            list2 .addObject("\(zyFriut2.name) - " + "\(index)")
        }
        zyFriut2.fruit = list2
        
        var tempList: NSArray = [zyFriut1, zyFriut2]
        return tempList;
    }()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataList.count;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataList[section].fruit.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell (style: .Default, reuseIdentifier: nil)
        
        let zyFruit: ZYFruit = dataList[indexPath.section] as! ZYFruit
        
        cell.textLabel?.text = zyFruit.fruit[indexPath.row] as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataList[section].name
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return dataList[section].desc
    }
    
}

//
//  FFristViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/7/29.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ZYFruiT: NSObject {
    var name: String = String ()
    var desc: String = String ()
    var fruit: NSArray = NSArray ()
}


class FFristViewController: UITableViewController {

    @IBOutlet weak var aTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var dataList: NSArray = {
        
        
        var zyFriut1: ZYFruiT = ZYFruiT()
        zyFriut1.name = "第一筐水果"
        zyFriut1.desc = "多汁"
        var list: NSMutableArray = NSMutableArray ()
        for index: Int in 0 ..< 10 {
            list .addObject("\(zyFriut1.name) - " + "\(index)")
        }
        zyFriut1.fruit = list
        
        
        var zyFriut2: ZYFruiT = ZYFruiT()
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
    
    
    //Tableview中一共有几个Sections
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataList.count;
    }
    
    //tableview具体设置吧？？？？
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataList[section].fruit.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell (style: .Default, reuseIdentifier: nil)
        let zyFruiT: ZYFruiT = dataList[indexPath.section] as! ZYFruiT
        cell.textLabel?.text = zyFruiT.fruit[indexPath.row] as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataList[section].name
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return dataList[section].desc

    }
}

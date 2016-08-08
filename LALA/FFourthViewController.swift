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
    
    
    @IBOutlet weak var ButtonTopRight: UIButton!
    @IBOutlet weak var ButtonTopLeft: UIBarButtonItem!
    
    
    var shifoudenglu :NSString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //读取数据，用户是否登录
        let diaryList:String = NSBundle.mainBundle().pathForResource("Shi_Fou_Deng_Lu", ofType:"plist")!
        let data:NSMutableDictionary = NSMutableDictionary(contentsOfFile:diaryList)!
        let da:NSString = data.objectForKey("islog") as! NSString
        print(da)
        shifoudenglu = da

    }
    @IBAction func ButtonTopLeftClick(sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SettingTableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ButtonTopRightClick(sender: AnyObject) {
        if shifoudenglu == "NO" {
            //没有登录
            print("还没有登录呢")
            //跳去登录页面
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DengLuViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            print("早就登录了")
        }
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

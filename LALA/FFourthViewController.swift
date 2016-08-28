//
//  FFristViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/10.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import AlamofireImage
import Alamofire
import CoreData
import Foundation
import SwiftyJSON

class FFourthViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    var shifoudenglu = ""
    
    @IBAction func Setting_Click(sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SettingTableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Zhuce_Denglu(sender: AnyObject) {
        if shifoudenglu != "NO" {
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


    @IBOutlet weak var MainTableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
    
        MainTableView.dataSource = self
        MainTableView.delegate = self
    
    }
    //////////////////tableView_start


    //tableview 的 高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 205
    }

    //TableView 中有几个 Section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    //一个Section 中 tableview的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    var Imageload:Image = UIImage(named: "Black.png")!
    var Imageloadw:Image = UIImage(named: "White.png")!

    //tableview 的集体内容的填充
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = MainTableView.dequeueReusableCellWithIdentifier("FForth_User_IF_TableViewCell", forIndexPath: indexPath) as!  FForth_User_IF_TableViewCell
        
        cell.User_Icon.image = Imageload
        cell.User_VIP.image = Imageload
        
        cell.USER_NAME.text = "Thomas Liu"
        cell.USER_JIAN_JIE.text = "简介：这是第一个简介"
        
        cell.NEWS_NUMBERS.text = "111"
        cell.Fans_Number.text = "222"
        cell.Fouse_Number.text = "333"
        
        cell.NEWS_WORD.text = "我的"
        cell.Fans_Word.text = "粉丝"
        cell.Focus_Word.text = "关注"
        
        cell.Image_Space.image = Imageload
    
        return cell
    
    }

    /////////////tableView_end


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

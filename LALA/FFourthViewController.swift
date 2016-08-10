//
//  FFourthViewController.swift
//  Link_Now
//
//  Created by Thomas Liu on 16/8/7.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation



//Tab bar我的页面
class FFourthViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var ButtonTopRight: UIButton!
    @IBOutlet weak var ButtonTopLeft: UIBarButtonItem!
    
    @IBOutlet weak var TimeTableView: UITableView!
    
    var shifoudenglu :NSString = ""
    var data = [
        
        timecell(
            image_left_top: "user-female-vector", image_right_top: "user-female-vector",
            image_mid_left: "user-female-vector", image_mid_mid: "user-female-vector",   image_mid_right: "user-female-vector",
            image_left_bottom: "user-female-vector",  image_right_bottom: "user-female-vector",
            /////////
            lable_sender: "用户1"   ,
            lable_time: "1234",
            lable_pinglun_number:"123",  lable_zan_number:"123"
        ),
        
        timecell(
            image_left_top: "user-female-vector", image_right_top: "user-female-vector",
            image_mid_left: "user-female-vector", image_mid_mid: "user-female-vector",   image_mid_right: "user-female-vector",
            image_left_bottom: "user-female-vector",  image_right_bottom: "user-female-vector",
            /////////
            lable_sender: "用户2"   ,
            lable_time: "123456",
            lable_pinglun_number:"123",  lable_zan_number:"234"
        ),
        
        timecell(
            image_left_top: "user-female-vector", image_right_top: "user-female-vector",
            image_mid_left: "user-female-vector", image_mid_mid: "user-female-vector",   image_mid_right: "user-female-vector",
            image_left_bottom: "user-female-vector",  image_right_bottom: "user-female-vector",
            /////////
            lable_sender: "用户3"   ,
            lable_time: "123456789",
            lable_pinglun_number:"123",  lable_zan_number:"345"
        )
        
        //video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TimeTableView.dataSource = self
        TimeTableView.delegate = self
        
        //读取数据，用户是否登录
        let diaryList:String = NSBundle.mainBundle().pathForResource("Shi_Fou_Deng_Lu", ofType:"plist")!
        let data:NSMutableDictionary = NSMutableDictionary(contentsOfFile:diaryList)!
        let da:NSString = data.objectForKey("islog") as! NSString
        print(da)
        shifoudenglu = da

    }
    //////////////////tableView_start
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 205
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFourthTableViewCell", forIndexPath: indexPath) as! FFourthTableViewCell
        let video = data[indexPath.row]
        
//        cell.videoScreenshot.image = UIImage(named: video.image)
//        cell.videoTitleLabel.text = video.title
//        cell.videoSourceLabel.text = video.source
        
        cell.image_left_top.image = UIImage(named:video.image_left_top )
        cell.image_right_top.image = UIImage(named:video.image_right_top )
        cell.image_mid_left.image = UIImage(named:video.image_mid_left )
        cell.image_mid_mid.image = UIImage(named:video.image_mid_mid )
        cell.image_mid_right.image = UIImage(named:video.image_mid_right )
        cell.image_left_bottom.image = UIImage(named:video.image_left_top )
        cell.image_right_bottom.image = UIImage(named:video.image_right_bottom )
        /////////
        cell.lable_sender.text = video.lable_sender
        cell.lable_time.text = video.lable_time
        cell.lable_zan_number.text = video.lable_zan_number
        cell.lable_pinglun_number.text = video.lable_pinglun_number
        
        return cell
        
    }
    
    ///////////////tableView_end

    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

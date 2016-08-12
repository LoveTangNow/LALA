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
import AlamofireImage
import Alamofire

//Tab bar我的页面
class FFristViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var ButtonTopRight: UIButton!
    @IBOutlet weak var ButtonTopLeft: UIBarButtonItem!
    
    @IBOutlet weak var TimeTableView: UITableView!
    
    var Tableview_count:Int = 0
    
    var shifoudenglu :NSString = ""
    var data = [
        
        timecell(
            image_left_top: "Black", image_right_top: "Black",
            image_mid_left: "Black", image_mid_mid: "Black",   image_mid_right: "Black",
            image_left_bottom: "Black",  image_right_bottom: "Black",
            /////////
            lable_sender: "用户1"   ,
            lable_time: "1234",
            lable_pinglun_number:"123",  lable_zan_number:"123"
        ),
        
        timecell(
            image_left_top: "Black", image_right_top: "Black",
            image_mid_left: "Black", image_mid_mid: "Black",   image_mid_right: "Black",
            image_left_bottom: "Black",  image_right_bottom: "Black",
            /////////
            lable_sender: "用户2"   ,
            lable_time: "123456",
            lable_pinglun_number:"123",  lable_zan_number:"234"
        ),
        
        timecell(
            image_left_top: "Black", image_right_top: "Black",
            image_mid_left: "Black", image_mid_mid: "Black",   image_mid_right: "Black",
            image_left_bottom: "Black",  image_right_bottom: "Black",
            /////////
            lable_sender: "用户3"   ,
            lable_time: "123456",
            lable_pinglun_number:"123",  lable_zan_number:"234"
        ),
        timecell(
            image_left_top: "Black", image_right_top: "Black",
            image_mid_left: "Black", image_mid_mid: "Black",   image_mid_right: "Black",
            image_left_bottom: "Black",  image_right_bottom: "Black",
            /////////
            lable_sender: "用户4"   ,
            lable_time: "123456",
            lable_pinglun_number:"123",  lable_zan_number:"234"
        ),

    ]
    
    var data2 = [
            a456TableViewCell(
                Image_top_left:"Black", Image_top_right: "Black",
                Image1: "Black",     Image2: "Black",     Image3: "Black",
                Image4: "Black",     Image5: "Black",     Image6: "Black",
                Image_Bottom: "Black",
                ////////////
                Lable_sender: "liu",   Lable_others: "12467880988"
            )
    ]
    
    var data3:[TableViewCell_1_big] = []
    

    
    
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
        
        //data3 += []
        
        Alamofire.request(.GET, "http://localhost:80/LALA/aiqinhai04.jpg")
            .responseImage { response in
                
                //                debugPrint(response)
                //                print(response.request)
                //                print(response.response)
                //                debugPrint(response.result)
                
                if let image = response.result.value {
                    print("image downloaded: \(image)")
                    self.data3.append(TableViewCell_1_big(
                        UIImageView_Top_Left:image,
                        UIImageView_Top_Right:image,
                        UIImageView_Main:image,
                        UIImageView_Bottom:image)
                    )
                    self.TimeTableView.reloadData()
                }
        }
    }
    //////////////////tableView_start
    
    
    //Tableview cell高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        print("Tableview cell高度")
        return 292
        
    }
    
    //TableView中Sections的数量
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("TableView中Sections的数量")
        return 1
    }
    
    //几个Tableview cell
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("几个Tableview cell")
        return 3
    }
    
//    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
//        return ["a","b","c","d","e","f","g","h","i","j","k","l"]
//    }
    
    
    //Tableview初始化
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("Tableview初始化")
        
        print(indexPath.row)
        let a = indexPath.row
        
        if a % 3 == 0 {
            
        
            let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFourthTableViewCell", forIndexPath: indexPath) as! FFourthTableViewCell
            //let video = data[data_n]
            let video = data[0]
            
            print("kan 1")
            
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
        else if a % 3 == 1
        {
            
            let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFrist_1_big_TableViewCell", forIndexPath: indexPath) as! FFrist_1_big_TableViewCell
            
            if data3.isEmpty {
                
            }
            else{
                let v = data3[0]
                
                print("kan 2")
                
                cell.UIImageView_Top_Left.image = v.UIImageView_Top_Left
                cell.UIImageView_Top_Right.image = v.UIImageView_Top_Right
                cell.UIImageView_Mian.image = v.UIImageView_Main
                cell.UIImageView_bottom.image = v.UIImageView_Bottom
            }
            
            
            
            return cell
        }
        else{
            let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFrist456TableViewCell", forIndexPath: indexPath) as! FFrist456TableViewCell
            let v = data2[0]
            
            print("kan 3")
            
            cell.Image_top_left.image = UIImage(named: v.Image_top_left)
            cell.Image_top_right.image = UIImage(named: v.Image_top_right)
            cell.Image1.image = UIImage(named: v.Image1)
            cell.Image2.image = UIImage(named: v.Image2)
            cell.Image3.image = UIImage(named: v.Image3)
            cell.Image4.image = UIImage(named: v.Image4)
            cell.Image5.image = UIImage(named: v.Image5)
            cell.Image6.image = UIImage(named: v.Image6)
            cell.Image_Bottom.image = UIImage(named: v.Image_Bottom)
            
            cell.Lable_sender.text = v.Lable_sender
            cell.Lable_others.text = v.Lable_others
            
            return cell
        }
    }
    
    //??
    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
    
    
    //??
    // Override to support editing the table view.
      func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
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

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
    
    /*
     这里应该是这么几种不同的载入方式的数据
     适用于 9，8，7等长宽 图片的载入方式
     适用于 6，5，4等长宽 图片的载入方式.
     适用于 3，2等长宽 图片的载入方式.
     适用于 黄金比例 竖向 2图片的载入方式
     适用于 黄金比例 横向 1图片的载入方式.
     */
    
    //适用于 3，2等长宽 图片的载入方式
    var data = [
        
        timecell(
            detail_height:30,
            image_left_top: "Black", image_right_top: "Black",
            image_mid_left: "Black", image_mid_mid: "Black",   image_mid_right: "Black",
            image_left_bottom: "Black",  image_right_bottom: "Black",
            /////////
            lable_sender: "用户1"   ,
            lable_time: "1234",
            lable_pinglun_number:"123",  lable_zan_number:"123"
        )

    ]
    
    //适用于 6，5，4等长宽 图片的载入方式
    var data2 = [
            a456TableViewCell(
                detail_height:30,
                Image_top_left:"Black", Image_top_right: "Black",
                Image1: "Black",     Image2: "Black",     Image3: "Black",
                Image4: "Black",     Image5: "Black",     Image6: "Black",
                Image_Bottom: "Black",
                ////////////
                Lable_sender: "liu",   Lable_others: "12467880988"
            )
    ]
    
    //适用于 黄金比例 横向 1图片的载入方式
    var data3:[TableViewCell_1_big] = []
    

    //适用于 9，8，7等长宽 图片的载入方式
    var data4 = []
    
    
    //适用于 黄金比例 竖向 2图片的载入方式
    var data5 = []
    
    
    
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
        
        Alamofire.request(.GET, "http://localhost:80/LALA/aiqinhai04.jpg")
            .responseImage { response in
                
                //                debugPrint(response)
                //                print(response.request)
                //                print(response.response)
                //                debugPrint(response.result)
                
                if let image = response.result.value {
                    print("image downloaded: \(image)")
                    self.data3.append(TableViewCell_1_big(
                        detail_height:30,
                        UIImageView_Top_Left:image,
                        UIImageView_Top_Right:image,
                        UIImageView_Main:image,
                        UIImageView_Bottom:image)
                    )
                    self.TimeTableView.reloadData()
                }
        }
        
        /*
            Alamofire在异步获取数据之后，像数据数组插入数据
            数据插入之后 重新 load Data
        */
    }
    //////////////////tableView_start

    var height_tableview:CGFloat = 0
    
    
    //set Footer Height
     func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15;
    }
    
    //set Header Height
     func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15;
    }
    
    //set Header Title
     func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hello"
    }
    
    //set Footer Title
     func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "World"
    }
    
    //cell  DidSelectAction
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // 在tableview 的headView 上添加个view 其实你可以在这个view 加很多组件 在添加在HeadView
     func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        
        let view:UIView = UIView(frame: CGRectMake(0, 0,self.view.frame.size.width, 20));
        view.backgroundColor = UIColor.yellowColor();
        
        return  view;
        
    }
    
    //在footerView 添加个button
     func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
        
        let myButton:UIButton = UIButton(frame: CGRectMake(0, 0, self.view.frame.size.width, 20));
        myButton.setTitle("I am a Button", forState: UIControlState.Normal);
        myButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal);
        myButton.backgroundColor = UIColor.greenColor();
        return myButton;
    }
    
    //Tableview cell高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        print("Tableview cell高度")
        return height_tableview
        
        
    }
    
    //TableView中Sections的数量
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("TableView中Sections的数量")
        return data.count + data2.count + data3.count + data4.count + data5.count
    }
    
    //几个Tableview cell
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("几个Tableview cell")
        return 1
    }
    
//    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
//        return ["a","b","c","d","e","f","g","h","i","j","k","l"]
//    }
    
    
    //Tableview初始化
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("Tableview初始化")
        
        print(indexPath.row)
        let a = indexPath.row
        
        print()
        print("SECTION_TYPE")
        
        
        /*
            这里应该有这么几种不同的载入方式
            适用于 9，8，7等长宽 图片的载入方式
            适用于 6，5，4等长宽 图片的载入方式
            适用于 3，2等长宽 图片的载入方式
            适用于 黄金比例 竖向 2图片的载入方式
            适用于 黄金比例 横向 1图片的载入方式
            
            黄金比例：0.618
        */
        
        if a % 3 == 1 {
            
        
            let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFrist23TableViewCell", forIndexPath: indexPath) as! FFrist23TableViewCell
            //let video = data[data_n]
            let video = data[0]
            
            print("kan 1")
            
            //        cell.videoScreenshot.image = UIImage(named: video.image)
            //        cell.videoTitleLabel.text = video.title
            //        cell.videoSourceLabel.text = video.source
            cell.image_left_top.layer.cornerRadius = cell.image_left_top.frame.width/2
            cell.image_left_top.clipsToBounds = true
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
        else if a % 3 == 0
        {
            
            let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFrist_1_big_TableViewCell", forIndexPath: indexPath) as! FFrist_1_big_TableViewCell
            
            if data3.isEmpty {
                
            }
            else{
                let v = data3[0]
                
                print("kan 2")
                
//                cell.UIImageView_Top_Left.layer.shadowColor = UIColor.blackColor().CGColor
//                cell.UIImageView_Top_Left.layer.shadowOffset = CGSizeMake(0, 1)
//                cell.UIImageView_Top_Left.layer.shadowOpacity = 1
//                cell.UIImageView_Top_Left.layer.shadowRadius = 1.0

                //圆形 图片
                cell.UIImageView_Top_Left.layer.cornerRadius = cell.UIImageView_Top_Left.frame.width/2
                cell.UIImageView_Top_Left.clipsToBounds = true
                cell.UIImageView_Top_Left.image = v.UIImageView_Top_Left
                
                cell.UIImageView_Top_Right.image = v.UIImageView_Top_Right
                cell.UIImageView_Mian.image = v.UIImageView_Main
                cell.UIImageView_bottom.image = v.UIImageView_Bottom
                
                height_tableview = CGFloat(v.detail_height + v.height_without_detail)

            }
            

            
            
            
            return cell
        }
        else{
            let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFrist456TableViewCell", forIndexPath: indexPath) as! FFrist456TableViewCell
            let v = data2[0]
            
            print("kan 3")
            
            //圆形方法
            cell.Image_top_left.layer.cornerRadius = cell.Image_top_left.frame.size.width/2
            cell.Image_top_left.clipsToBounds = true
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
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SendNewsViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ButtonTopRightClick(sender: AnyObject) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

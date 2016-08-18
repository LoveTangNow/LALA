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
import CoreData
import Foundation

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
    var data3:[TableViewCell_1_big] = []

    
    //用两个Dictionary来存储下载下来的数据
    //同样猪标记符的是一组数据，dataimage是图片，datadetails是文字
    //从字典标识符1开始存储 ，0 表示不存在数据
    var dataimage = Dictionary<Int,[Dictionary<String,UIImageView>]>()
    var datadetails = Dictionary<Int,[Dictionary<String,String>]>();
    
    //var datat = Dictionary<String,[String: AnyObject]>()
    //var datt  = Dictionary<String,String>()
    
    var listItems  = [NSManagedObject]()

    
    func saveItem(itemToSave: String) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContex = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("User", inManagedObjectContext: managedContex)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContex)
        
        item.setValue(itemToSave, forKey: "userid")
        
        do {
            try managedContex.save()
            listItems.append(item)
        } catch {
            print("error")
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        for a in 0...10 {
            let item = listItems[a]
            print(item.valueForKey("userid") as? String)
        }
        
    }

    override func viewDidLoad() {
        
        for a in 0...10 {
            print(a)
            saveItem(String(a))
        }
        
        super.viewDidLoad()
        
        //datat["1"] = ["1":1]
        //datt["1"] = "1"
        
        //print(datat["1"]!["1"])
        //print(datt["1"])
        
        TimeTableView.dataSource = self
        TimeTableView.delegate = self
        
        datadetails[1] = [["sender":"宋喆"],["title":"老子干的"],["style":"Suit_1_big_photos"]]
        datadetails[2] = [["sender":"马蓉"],["title":"老娘干的"],["style":"Suit_2_3_photos"]]
        datadetails[3] = [["sender":"王宝强"],["title":"他俩干的"],["style":"Suit_4_5_6_photos"]]
        datadetails[4] = [["sender":"隔壁老王"],["title":"不是我干的"],["style":"Suit_7_8_9_photos"]]
        
        /*
         
         */
        print("------------------------------")
        print(datadetails[1]![1]["title"])
        print("------------------------------")
        
        
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
        let str = "iOS Developer Tips encoded in Base64"
        print("Original: \(str)")
        
        // UTF 8 str from original
        // NSData! type returned (optional)
        let utf8str = str.dataUsingEncoding(NSUTF8StringEncoding)
        
        // Base64 encode UTF 8 string
        // fromRaw(0) is equivalent to objc 'base64EncodedStringWithOptions:0'
        // Notice the unwrapping given the NSData! optional
        // NSString! returned (optional)
        let base64Encoded = utf8str!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        print("Encoded:  \(base64Encoded)")
        //正确以上
        
        // Base64 Decode (go back the other way)
        // Notice the unwrapping given the NSString! optional
        // NSData returned
        let dataa = NSData(base64EncodedString: base64Encoded, options: NSDataBase64DecodingOptions(rawValue: 0))
//        
//        // Convert back to a string
        let base64Decoded = NSString(data: dataa!, encoding: NSUTF8StringEncoding)
        print("Decoded:  \(base64Decoded)")
        
        //解密也可以了
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
//     func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Hello"
//    }
    
    //set Footer Title
//     func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "World"
//    }
    
    //cell  DidSelectAction
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("点击了"+String(indexPath.row))
    }
    
    // 在tableview 的headView 上添加个view 其实你可以在这个view 加很多组件 在添加在HeadView
//     func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
//        
//        let view:UIView = UIView(frame: CGRectMake(0, 0,self.view.frame.size.width, 20));
//        view.backgroundColor = UIColor.yellowColor();
//        
//        return  view;
//    }
    
    //在footerView 添加个button
//     func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
//        
//        let myButton:UIButton = UIButton(frame: CGRectMake(0, 0, self.view.frame.size.width, 20));
//        myButton.setTitle("I am a Button", forState: UIControlState.Normal);
//        myButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal);
//        myButton.backgroundColor = UIColor.greenColor();
//        return myButton;
//    }
    
    //Tableview cell高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        //print("Tableview cell高度")
        return height_tableview
        
        
    }
    
    //TableView中Sections的数量
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("TableView中Sections的数量")
        return 1
    }
    
    //几个Tableview cell
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("几个Tableview cell")
        return datadetails.count
    }
    
//    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
//        return ["a","b","c","d","e","f","g","h","i","j","k","l"]
//    }
    
    
    //Tableview初始化
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("Tableview初始化")
        
        print(indexPath.row + 1)
        print("indexPath")
        
        /*
         indexPath.row 是从 “0” 开始的
            这里应该有这么几种不同的载入方式
            适用于 9，8，7等长宽 图片的载入方式 .
            适用于 6，5，4等长宽 图片的载入方式 .
            适用于 3，2等长宽 图片的载入方式    .
            适用于 黄金比例 竖向 2图片的载入方式
            适用于 黄金比例 横向 1图片的载入方式.
            
            黄金比例：0.618
        */
        
        
        if datadetails[indexPath.row + 1]![2]["style"] != nil {
            
            switch datadetails[indexPath.row + 1]![2]["style"]! {
            case "Suit_1_big_photos"://
                print("Suit_1_big_photos")
                let cell1 = TimeTableView.dequeueReusableCellWithIdentifier("FFrist_1_big_TableViewCell", forIndexPath: indexPath) as! FFrist_1_big_TableViewCell
                
                if data3.isEmpty {
                }
                else{
                    let v = data3[0]
                    
                    cell1.UIImageView_Top_Left.layer.cornerRadius = cell1.UIImageView_Top_Left.frame.width/2
                    cell1.UIImageView_Top_Left.clipsToBounds = true
                    cell1.UIImageView_Top_Left.image = v.UIImageView_Top_Left
                    
                    cell1.UIImageView_Top_Right.image = v.UIImageView_Top_Right
                    
                    let screenBounds = UIScreen.mainScreen().bounds.width
                    print(screenBounds)
                    print("screnn")

                    cell1.UIImageView_Mian.image = v.UIImageView_Main
                    
                    cell1.UIImageView_bottom.image = v.UIImageView_Bottom
                    
                    height_tableview = CGFloat(cell1.height_without_detail  + cell1.detail_height) + ( screenBounds - 10 ) * 0.618
                }
                return cell1
                
            case "Suit_2_3_photos"://
                print("Suit_2_3_photos")
                let cell2 = TimeTableView.dequeueReusableCellWithIdentifier("FFrist23TableViewCell", forIndexPath: indexPath) as! FFrist23TableViewCell
                if data3.isEmpty {
                }
                else{
                    let v = data3[0]
                    
                    cell2.image_left_top.layer.cornerRadius = cell2.image_left_top.frame.width/2
                    cell2.image_left_top.clipsToBounds = true
                    cell2.image_left_top.image = v.UIImageView_Bottom
                    cell2.image_right_top.image = v.UIImageView_Bottom
                    
                    cell2.image_mid_left.image = v.UIImageView_Bottom
                    cell2.image_mid_mid.image = v.UIImageView_Bottom
                    cell2.image_mid_right.image = v.UIImageView_Bottom
                    
                    cell2.image_left_bottom.image = v.UIImageView_Bottom
                    cell2.image_right_bottom.image = v.UIImageView_Bottom
                    
                    height_tableview = CGFloat(cell2.height_without_detail + cell2.detail_height)
                }
                return cell2
                
                
            case "Suit_4_5_6_photos"://
                print("Suit_4_5_6_photos")
                let cell3 = TimeTableView.dequeueReusableCellWithIdentifier("FFrist456TableViewCell", forIndexPath: indexPath) as! FFrist456TableViewCell
                if data3.isEmpty {
                }
                else{
                    let v = data3[0]
                    
                    cell3.Image_top_left.layer.cornerRadius = cell3.Image_top_left.frame.width/2
                    cell3.Image_top_left.clipsToBounds = true
                    cell3.Image_top_left.image = v.UIImageView_Bottom
                    cell3.Image_top_right.image = v.UIImageView_Bottom
                    
                    cell3.Image1.image =  v.UIImageView_Bottom
                    cell3.Image2.image =  v.UIImageView_Bottom
                    cell3.Image3.image =  v.UIImageView_Bottom
                    cell3.Image4.image =  v.UIImageView_Bottom
                    cell3.Image5.image =  v.UIImageView_Bottom
                    cell3.Image6.image =  v.UIImageView_Bottom
                    
                    cell3.Image_Bottom.image = v.UIImageView_Bottom
                    
                    height_tableview = CGFloat(cell3.height_without_detail + cell3.detail_height)
                }
                return cell3
                
            case "Suit_7_8_9_photos"://
                print("Suit_7_8_9_photos")
                let cell4 = TimeTableView.dequeueReusableCellWithIdentifier("FFrist789TableViewCell", forIndexPath: indexPath) as! FFrist789TableViewCell
                if data3.isEmpty {
                }
                else{
                    let v = data3[0]
                    
                    cell4.UIImageView_Top_Left.layer.cornerRadius = cell4.UIImageView_Top_Left.frame.width/2
                    cell4.UIImageView_Top_Left.clipsToBounds = true
                    cell4.UIImageView_Top_Left.image = v.UIImageView_Top_Left
                    cell4.UIImageView_Top_Right.image = v.UIImageView_Top_Left
                    
                    cell4.UIImageView_Main1.image = v.UIImageView_Top_Left
                    cell4.UIImageView_Main2.image = v.UIImageView_Top_Left
                    cell4.UIImageView_Main3.image = v.UIImageView_Top_Left
                    cell4.UIImageView_Main4.image = v.UIImageView_Top_Left
                    cell4.UIImageView_Main5.image = v.UIImageView_Top_Left
                    cell4.UIImageView_Main6.image = v.UIImageView_Top_Left
                    cell4.UIImageView_Main7.image = v.UIImageView_Top_Left
                    cell4.UIImageView_Main8.image = v.UIImageView_Top_Left
                    cell4.UIImageView_Main9.image = v.UIImageView_Top_Left
                    
                    cell4.UIImageView_Bottom.image = v.UIImageView_Bottom
                    
                    height_tableview = CGFloat(cell4.height_without_detail + cell4.detail_height)
                    
                }
                return cell4
                
            default:
                print("nothing")
                
            }
            
            }
        

        let cell1 = TimeTableView.dequeueReusableCellWithIdentifier("FFrist_1_big_TableViewCell", forIndexPath: indexPath) as! FFrist_1_big_TableViewCell
        print("kan 2")
        
        if data3.isEmpty {
        }
        else{
            let v = data3[0]
            
            cell1.UIImageView_Top_Left.layer.cornerRadius = cell1.UIImageView_Top_Left.frame.width/2
            cell1.UIImageView_Top_Left.clipsToBounds = true
            cell1.UIImageView_Top_Left.image = v.UIImageView_Top_Left
            
            cell1.UIImageView_Top_Right.image = v.UIImageView_Top_Right
            cell1.UIImageView_Mian.image = v.UIImageView_Main
            cell1.UIImageView_bottom.image = v.UIImageView_Bottom
            
            height_tableview = CGFloat(v.detail_height + v.height_without_detail)
        }
        return cell1
        

        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let imgback=UIImage(named:"Black.png")
        let imgbackV=UIImageView(image: imgback)
        cell.backgroundView = imgbackV
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

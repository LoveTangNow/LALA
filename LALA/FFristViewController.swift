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
import SwiftyJSON

//Tab bar我的页面
class FFristViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    //MARK:Data
    
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
    var dataimage = Dictionary<Int,[Dictionary<String,String>]>()
    var datadetails = Dictionary<Int,[Dictionary<String,String>]>();
    
    //var datat = Dictionary<String,[String: AnyObject]>()
    //var datt  = Dictionary<String,String>()
    
    var listItems  = [NSManagedObject]()
    
    var Imageload:Image = UIImage(named: "Black.png")!
    
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
    
    
    /*
     当一个视图控制器被创建，并在屏幕上显示的时候。 代码的执行顺序
     1、 alloc                                   创建对象，分配空间
     2、init (initWithNibName) 初始化对象，初始化数据
     3、loadView                  从nib载入视图 ，通常这一步不需要去干涉。除非你没有使用xib文件创建视图
     4、viewDidLoad               载入完成，可以进行自定义数据以及动态创建其他控件
     5、viewWillAppear            视图将出现在屏幕之前，马上这个视图就会被展现在屏幕上了
     6、viewDidAppear             视图已在屏幕上渲染完成
     
     当一个视图被移除屏幕并且销毁的时候的执行顺序，这个顺序差不多和上面的相反
     1、viewWillDisappear            视图将被从屏幕上移除之前执行
     2、viewDidDisappear             视图已经被从屏幕上移除，用户看不到这个视图了
     3、dealloc                      视图被销毁，此处需要对你在init和viewDidLoad中创建的对象进行释放
     */
    
    
    //MARK:View
    
    
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
       print("viewDidDisappear")
    }
    
    override func viewDidLoad() {
        print("viewDidLoad")
        
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
        
        //-------------------------------Reall----Start---------------------------------//
        
        Alamofire.request(.GET, "http://localhost:80/LALA/GIVE_BACK_PHOTO.php",parameters: ["data": "bar"])
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        //在这里把数据写入字典里？
                        print("--------------------start--------------------")
                        
                        //用两个Dictionary来存储下载下来的数据
                        //同样猪标记符的是一组数据，dataimage是图片，datadetails是文字
                        //从字典标识符1开始存储 ，0 表示不存在数据
                        //var datadetails = Dictionary<Int,[Dictionary<String,String>]>();
                        
                        
                        
                        for i in 0  ..< json.count
                        {
                            let newstime:String = json[i]["newstime"].string!
                            let device:String = json[i]["device"].string!
                            let senderid:String = json[i]["senderid"].string!
                            let sendername:String = json[i]["sendername"].string!
                            let photonumber = json[i]["photo"].count
                            let s = self.datadetails.count
                            
                            var PhotoArray =  [String]()
                            
                            for j in 0  ..< photonumber
                            {
                                let path:String = json[i]["photo"][j].string!
                                PhotoArray.append(path)
                            }
                            
                            switch photonumber
                            {
                            case 1:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_1_big_photos"]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]]]
                            case 2:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_2_3_photos"]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]]]
                            case 3:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_2_3_photos"]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]]]
                            case 4:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_4_5_6_photos"]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]]]
                            case 5:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_4_5_6_photos"]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]],["Photo5":PhotoArray[4]]]
                            case 6:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_4_5_6_photos"]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]],["Photo5":PhotoArray[4]],["Photo6":PhotoArray[5]]]
                            case 7:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_7_8_9_photos"]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]],["Photo5":PhotoArray[4]],["Photo6":PhotoArray[5]],["Photo7":PhotoArray[6]]]
                            case 8:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_7_8_9_photos"]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]],["Photo5":PhotoArray[4]],["Photo6":PhotoArray[5]],["Photo7":PhotoArray[6]],["Photo8":PhotoArray[7]]]
                            case 9:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_7_8_9_photos"]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]],["Photo5":PhotoArray[4]],["Photo6":PhotoArray[5]],["Photo7":PhotoArray[6]],["Photo8":PhotoArray[7]],["Photo9":PhotoArray[8]]]
                            default:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Without_Photos"]]
                                
                            }
                        }
                        
                        print(self.datadetails)
                        print("")
                        print(self.dataimage)
                        
                        print("---------------------end---------------------")
                        
                    }
                case .Failure(let error):
                    print(error)
                }
        }
        
        //-------------------------------Reall----End-----------------------------------//
        
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
    
    
    //MARK:Tableview
    
    //cell  DidSelectAction
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("点击了"+String(indexPath.row))
    }
    
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
        return datadetails.count - 2
    }
    
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
            适用于 黄金比例 横向 1图片的载入方式.
         
            适用于无图片的载入方式。
            
            黄金比例：0.618
        */
        
        
        if datadetails[indexPath.row + 1]![4]["style"] != nil {
            
            switch datadetails[indexPath.row + 1]![4]["style"]! {
            case "Suit_1_big_photos"://
                print("Suit_1_big_photos")
                let cell1 = TimeTableView.dequeueReusableCellWithIdentifier("FFrist_1_big_TableViewCell", forIndexPath: indexPath) as! FFrist_1_big_TableViewCell
                
                if datadetails.isEmpty || dataimage.isEmpty {
 
                    cell1.UIImageView_Top_Left.layer.cornerRadius = cell1.UIImageView_Top_Left.frame.width/2
                    cell1.UIImageView_Top_Left.clipsToBounds = true
                    cell1.UIImageView_Top_Left.image = Imageload
                    cell1.UIImageView_Top_Right.image = Imageload
                    cell1.UIImageView_Mian.image = Imageload
                    cell1.UIImageView_bottom.image = Imageload
        
                    let screenBounds = UIScreen.mainScreen().bounds.width
                    
                    height_tableview = CGFloat(cell1.height_without_detail  + cell1.detail_height) + ( screenBounds - 10 ) * 0.618 + 5
                }
                else{
                    let v = data3[0]
                    
                    cell1.UIImageView_Top_Left.layer.cornerRadius = cell1.UIImageView_Top_Left.frame.width/2
                    cell1.UIImageView_Top_Left.clipsToBounds = true
                    cell1.UIImageView_Top_Left.image = v.UIImageView_Top_Left
                    
                    cell1.UIImageView_Top_Right.image = v.UIImageView_Top_Right

                    cell1.UIImageView_Mian.image = v.UIImageView_Main
                    
                    cell1.UIImageView_bottom.image = v.UIImageView_Bottom
                    
                    let screenBounds = UIScreen.mainScreen().bounds.width

                    height_tableview = CGFloat(cell1.height_without_detail  + cell1.detail_height) + ( screenBounds - 10 ) * 0.618  + 5
                }
                return cell1
                
            case "Suit_2_3_photos"://
                print("Suit_2_3_photos")
                let cell2 = TimeTableView.dequeueReusableCellWithIdentifier("FFrist23TableViewCell", forIndexPath: indexPath) as! FFrist23TableViewCell
                if data3.isEmpty {
                    cell2.image_left_top.layer.cornerRadius = cell2.image_left_top.frame.width/2
                    cell2.image_left_top.clipsToBounds = true
                    cell2.image_left_top.image = Imageload
                    cell2.image_right_top.image = Imageload
                    
                    cell2.image_mid_left.image = Imageload
                    cell2.image_mid_mid.image = Imageload
                    cell2.image_mid_right.image = Imageload
                    
                    cell2.image_bottom.image = Imageload
                    
                    
                    height_tableview = CGFloat(100 + cell2.detail_height) + ( UIScreen.mainScreen().bounds.width - 0 ) / 3 + 5
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
                    
                    cell2.image_bottom.image = v.UIImageView_Bottom

                    
                    height_tableview = CGFloat(100 + cell2.detail_height) + ( UIScreen.mainScreen().bounds.width - 30 ) / 3 + 5
                }
                return cell2
                
                
            case "Suit_4_5_6_photos"://
                print("Suit_4_5_6_photos")
                let cell3 = TimeTableView.dequeueReusableCellWithIdentifier("FFrist456TableViewCell", forIndexPath: indexPath) as! FFrist456TableViewCell
                if data3.isEmpty {
                    cell3.Image_top_left.layer.cornerRadius = cell3.Image_top_left.frame.width/2
                    cell3.Image_top_left.clipsToBounds = true
                    cell3.Image_top_left.image = Imageload
                    cell3.Image_top_right.image = Imageload
                    
                    cell3.Image1.image =  Imageload
                    cell3.Image2.image =  Imageload
                    cell3.Image3.image =  Imageload
                    cell3.Image4.image =  Imageload
                    cell3.Image5.image = Imageload
                    cell3.Image6.image =  Imageload
                    
                    cell3.Image_Bottom.image = Imageload
                    
                    let screenBounds = UIScreen.mainScreen().bounds.width
                    
                    height_tableview = CGFloat(95 + cell3.detail_height) + ( (screenBounds - 20) / 3 * 2 ) + 15 + 5
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
                    
                    let screenBounds = UIScreen.mainScreen().bounds.width
                    
                    height_tableview = CGFloat(95 + cell3.detail_height) + ( (screenBounds - 20) / 3 * 2 ) + 15 + 5
                }
                return cell3
                
            case "Suit_7_8_9_photos"://
                print("Suit_7_8_9_photos")
                let cell4 = TimeTableView.dequeueReusableCellWithIdentifier("FFrist789TableViewCell", forIndexPath: indexPath) as! FFrist789TableViewCell
                if data3.isEmpty {
                    cell4.UIImageView_Top_Left.layer.cornerRadius = cell4.UIImageView_Top_Left.frame.width/2
                    cell4.UIImageView_Top_Left.clipsToBounds = true
                    cell4.UIImageView_Top_Left.image = Imageload
                    cell4.UIImageView_Top_Right.image = Imageload
                    
                    cell4.UIImageView_Main1.image = Imageload
                    cell4.UIImageView_Main2.image = Imageload
                    cell4.UIImageView_Main3.image = Imageload
                    cell4.UIImageView_Main4.image = Imageload
                    cell4.UIImageView_Main5.image = Imageload
                    cell4.UIImageView_Main6.image = Imageload
                    cell4.UIImageView_Main7.image = Imageload
                    cell4.UIImageView_Main8.image = Imageload
                    cell4.UIImageView_Main9.image = Imageload
                    
                    cell4.UIImageView_Bottom.image = Imageload
                    
                    let screenBounds = UIScreen.mainScreen().bounds.width
                    
                    height_tableview = CGFloat(100 + cell4.detail_height) + screenBounds - 5
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
                    
                    let screenBounds = UIScreen.mainScreen().bounds.width
                    
                    height_tableview = CGFloat(100 + cell4.detail_height) + screenBounds - 5
                    
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
    
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        let imgback=UIImage(named:"Black.png")
//        let imgbackV=UIImageView(image: imgback)
//        cell.backgroundView = imgbackV
//    }
    
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
    
    //MARK:Functions
    
    func getDeviceVersion () -> String? {
        let name = UnsafeMutablePointer<utsname>.alloc(1)
        uname(name)
        let machine = withUnsafePointer(&name.memory.machine, { (ptr) -> String? in
            
            let int8Ptr = unsafeBitCast(ptr, UnsafePointer<CChar>.self)
            return String.fromCString(int8Ptr)
        })
        name.dealloc(1)
        if let deviceString = machine {
            switch deviceString {
            //iPhone
            case "iPhone1,1":                return "iPhone 1G"
            case "iPhone1,2":                return "iPhone 3G"
            case "iPhone2,1":                return "iPhone 3GS"
            case "iPhone3,1", "iPhone3,2":   return "iPhone 4"
            case "iPhone4,1":                return "iPhone 4S"
            case "iPhone5,1", "iPhone5,2":   return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":   return "iPhone 5C"
            case "iPhone6,1", "iPhone6,2":   return "iPhone 5S"
            case "iPhone7,1":                return "iPhone 6 Plus"
            case "iPhone7,2":                return "iPhone 6"
            case "iPhone8,1":                return "iPhone 6s"
            case "iPhone8,2":                return "iPhone 6s Plus"
            case "iPhone8,3":                return "iPhone SE"
            default:
                return deviceString
            }
        } else {
            return nil
        }
    }

    
    @IBAction func ButtonTopLeftClick(sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SendNewsViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ButtonTopRightClick(sender: AnyObject) {

    }
    
    
    //MARK:Others
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

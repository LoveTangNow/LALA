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
    
    var listItems  = [NSManagedObject]()
    /*
     这里应该是这么几种不同的载入方式的数据
     适用于 9，8，7等长宽 图片的载入方式
     适用于 6，5，4等长宽 图片的载入方式.
     适用于 3，2等长宽 图片的载入方式.
     适用于 黄金比例 竖向 2图片的载入方式
     适用于 黄金比例 横向 1图片的载入方式.
     */

    //用两个Dictionary来存储下载下来的数据
    //同样猪标记符的是一组数据，dataimage是图片，datadetails是文字
    //从字典标识符1开始存储 ，0 表示不存在数据
    var dataimage = Dictionary<Int,[Dictionary<String,String>]>()
    var datadetails = Dictionary<Int,[Dictionary<String,String>]>();
    
    //肌肤默认的图片
    var Imageload:Image = UIImage(named: "Black.png")!
    var Imageloadw:Image = UIImage(named: "White.png")!
    var ImageloadBackGroud:Image = UIImage(named: "FirstBackGround.png")!
    var ImageloadBackGroudn:Image = UIImage(named: "BackGround.png")!
    
    
    var height_tableview:CGFloat = 0 //tableviewcell 的高度
    var ShiFou_QingQiuDao_ShuJu = true
    
    
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
    //MARK:ButtonClick
    
    //扫一扫
    @IBAction func Sao_yi_sao(sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SettingTableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //发动态
    @IBAction func Send_Dongtai(sender: AnyObject) {
        let vc = UIStoryboard(name: "SecondBoard", bundle: nil).instantiateViewControllerWithIdentifier("Send_News_TableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
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
        
        let imgbackV = UIImageView(image: ImageloadBackGroudn)
        self.TimeTableView.backgroundView = imgbackV
        
        print("viewDidLoad")
        
        for a in 0...10 {
            print(a)
            saveItem(String(a))
        }
        
        super.viewDidLoad()
        
        TimeTableView.dataSource = self
        TimeTableView.delegate = self
        
        //读取数据，用户是否登录
        let diaryList:String = NSBundle.mainBundle().pathForResource("Shi_Fou_Deng_Lu", ofType:"plist")!
        let data:NSMutableDictionary = NSMutableDictionary(contentsOfFile:diaryList)!
        let da:NSString = data.objectForKey("islog") as! NSString
        print(da)
        shifoudenglu = da
        
        //-------------------------------Reall----Start---------------------------------//
        
        Alamofire.request(.GET, "http://localhost:80/LALA/GIVE_BACK_PHOTO.php",parameters: ["data": "bar"])
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    self.ShiFou_QingQiuDao_ShuJu = true
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
                            let newdetail:String = json[i]["detail"].string!
                            let newsid:String = json[i]["newsid"].string!
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
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_1_big_photos"],["detail":newdetail],["newsid":newsid]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]]]
                            case 2:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_2_3_photos"],["detail":newdetail],["newsid":newsid]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]]]
                            case 3:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_2_3_photos"],["detail":newdetail],["newsid":newsid]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]]]
                            case 4:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_4_5_6_photos"],["detail":newdetail],["newsid":newsid]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]]]
                            case 5:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_4_5_6_photos"],["detail":newdetail],["newsid":newsid]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]],["Photo5":PhotoArray[4]]]
                            case 6:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_4_5_6_photos"],["detail":newdetail],["newsid":newsid]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]],["Photo5":PhotoArray[4]],["Photo6":PhotoArray[5]]]
                            case 7:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_7_8_9_photos"],["detail":newdetail],["newsid":newsid]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]],["Photo5":PhotoArray[4]],["Photo6":PhotoArray[5]],["Photo7":PhotoArray[6]]]
                            case 8:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_7_8_9_photos"],["detail":newdetail],["newsid":newsid]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]],["Photo5":PhotoArray[4]],["Photo6":PhotoArray[5]],["Photo7":PhotoArray[6]],["Photo8":PhotoArray[7]]]
                            case 9:
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Suit_7_8_9_photos"],["detail":newdetail],["newsid":newsid]]
                                self.dataimage[s] = [["Photo1":PhotoArray[0]],["Photo2":PhotoArray[1]],["Photo3":PhotoArray[2]],["Photo4":PhotoArray[3]],["Photo5":PhotoArray[4]],["Photo6":PhotoArray[5]],["Photo7":PhotoArray[6]],["Photo8":PhotoArray[7]],["Photo9":PhotoArray[8]]]
                            default:
                                //0
                                self.datadetails[s] = [["newstime":newstime],["device":device],["senderid":senderid],["sendername":sendername],["style":"Without_Photos"],["detail":newdetail],["newsid":newsid]]
                                self.dataimage[s] = [["Photo":"null"]]
                                /*
                                 newstime
                                 device
                                 senderid
                                 sendername
                                 style
                                 
                                 photo 1-9 ?
                                 */
                            }
                        }
                        
                        //print(self.datadetails)
                        //print(self.dataimage)
                        
                        print("---------------------end---------------------")
                        self.TimeTableView.reloadData()
                    }
                case .Failure(let error):
                    self.ShiFou_QingQiuDao_ShuJu = false
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
        
        // Convert back to a string
        let base64Decoded = NSString(data: dataa!, encoding: NSUTF8StringEncoding)
        print("Decoded:  \(base64Decoded)")
        
        //解密也可以了
    }
    //////////////////tableView_start

    
    
    //MARK:Tableview
    
    //cell  DidSelectAction
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //var section_number = indexPath.section
        //这里得到的是 news id
        //self.datadetails[s] = 
        //0[["newstime":newstime],
        //1 ["device":device],
        //2 ["senderid":senderid],
        //3 ["sendername":sendername],
        //4 ["style":"Without_Photos"],
        //5 ["detail":newdetail],
        //6 ["newsid":newsid]]
        
        if datadetails.isEmpty {
            let newstime  :String = "NO NEWSTIME"
            let device    :String = "NO DEVICE"
            let sendername:String = "NO SENDER"
            let detail    :String = "NO DETAIL"
            let newsid    :String = "NO ID"
            let photonumber:Int   = 1
            
            NSUserDefaults.standardUserDefaults().setObject(newstime, forKey: "newstime")
            NSUserDefaults.standardUserDefaults().setObject(device, forKey: "device")
            NSUserDefaults.standardUserDefaults().setObject(sendername, forKey: "sendername")
            NSUserDefaults.standardUserDefaults().setObject(detail, forKey: "detail")
            NSUserDefaults.standardUserDefaults().setObject(newsid, forKey: "newsid")
            NSUserDefaults.standardUserDefaults().setObject(photonumber, forKey: "photonumber")
        }
        else
        {   let newstime  :String = datadetails[indexPath.row]![0]["newstime"]!
            let device    :String = datadetails[indexPath.row]![1]["device"]!
            let sendername:String = datadetails[indexPath.row]![3]["sendername"]!
            let detail    :String = datadetails[indexPath.row]![5]["detail"]!
            let newsid    :String = datadetails[indexPath.row]![6]["newsid"]!
            let photonumber:Int   = (dataimage[indexPath.row]?.count)!
            
            NSUserDefaults.standardUserDefaults().setObject(newstime, forKey: "newstime")
            NSUserDefaults.standardUserDefaults().setObject(device, forKey: "device")
            NSUserDefaults.standardUserDefaults().setObject(sendername, forKey: "sendername")
            NSUserDefaults.standardUserDefaults().setObject(detail, forKey: "detail")
            NSUserDefaults.standardUserDefaults().setObject(newsid, forKey: "newsid")
            NSUserDefaults.standardUserDefaults().setObject(photonumber, forKey: "photonumber")

        }
        
        
        //let cache = NSURLCache(memoryCapacity: 10 * 1024 * 1024,diskCapacity: 30 * 1024 * 1024,diskPath: "adow.adimageloader.urlcache")

        //--------跳转加传值--------//
        /*
         消息 id newsid
         用户 昵称  sendername
         消息的 时间 设备 senddevice
         消息的 长文字 detail
         消息的图片 缓存信息  ?????
         
         根据用户 id 去查询 评论   ????
         */
        //设置存储信息
        
        
        //设置同步
        NSUserDefaults.standardUserDefaults().synchronize()
        //跳转
        let vc = UIStoryboard(name: "SecondBoard", bundle: nil).instantiateViewControllerWithIdentifier("NewsDetailTableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        //=========================//
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
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    //几个Tableview cell
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("几个Tableview cell")
        if datadetails.isEmpty {
            return 3
        }//section 是从0开始的
        else{
            return datadetails.count
        }
    }
    
    //Tableview初始化
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //print("Tableview初始化")
        //print(indexPath.row + 1)
        //print("indexPath")
        //print(indexPath.section)
        
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
        let screenBounds = UIScreen.mainScreen().bounds.width
        let server:String = "http://localhost:80/LALA/photo/TEST_PHOTOS/"
        // 当datadetails 等于 空 没有数据的时候 用某某缩略图填充一下  感觉就像 Facebook了
        if  datadetails.isEmpty || dataimage.isEmpty {
            let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFrist_1_big_TableViewCell", forIndexPath: indexPath) as! FFrist_1_big_TableViewCell
            cell.UIImageView_BackGround.image = ImageloadBackGroud
            
            cell.UIImageView_Top_Right.hidden = true
            cell.UIImageView_Top_Right.hidden = true
            cell.UIImageView_Mian.hidden = true
            
            cell.UILabel_sender.hidden = true
            cell.UILabel_Information.hidden = true
            cell.UILabel_detail.hidden = true
            cell.UILabel_Pinglun.hidden = true
            cell.UILabel_Zan.hidden = true
            cell.UILabel_Cai.hidden = true
            
            height_tableview = ( screenBounds - 10 ) * 0.618  + 5
            
            return cell
        }
        
        if datadetails[indexPath.row]![4]["style"] != nil {
            switch datadetails[indexPath.row]![4]["style"]! {
            case "Suit_1_big_photos"://
                //print("Suit_1_big_photos")
                let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFrist_1_big_TableViewCell", forIndexPath: indexPath) as! FFrist_1_big_TableViewCell
                
                if datadetails.isEmpty || dataimage.isEmpty {
                }
                else{
                    let detail = datadetails[indexPath.row]
                    let images = dataimage[indexPath.row]
                    
                    cell.UIImageView_Top_Right.hidden = false
                    cell.UIImageView_Top_Right.hidden = false
                    cell.UIImageView_Mian.hidden = false
                    
                    cell.UILabel_sender.hidden = false
                    cell.UILabel_Information.hidden = false
                    cell.UILabel_detail.hidden = false
                    cell.UILabel_Pinglun.hidden = false
                    cell.UILabel_Zan.hidden = false
                    cell.UILabel_Cai.hidden = false
                    
                    cell.UILabel_sender.text = detail![3]["sendername"]
                    cell.UILabel_detail.text = detail![5]["detail"]
                    cell.UILabel_Information.text = detail![0]["newstime"]! + " 来自" + detail![1]["device"]!
                    
                    cell.UIImageView_BackGround.image = ImageloadBackGroudn
                    cell.UIImageView_Top_Left.image = Imageload
                    cell.UIImageView_Top_Right.image = Imageloadw

                    Alamofire.request(.GET, server + images![0]["Photo1"]!)
                        .responseImage { response in
                            if let image = response.result.value {
                                cell.UIImageView_Mian.image = image
                            }
                    }
                    
                    height_tableview = CGFloat(cell.Guding_Height) + ( screenBounds - 10 ) * 0.618  + 60

                }
                return cell
                
            case "Suit_2_3_photos"://
                //print("Suit_2_3_photos")
                let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFrist23TableViewCell", forIndexPath: indexPath) as! FFrist23TableViewCell
                if datadetails.isEmpty || dataimage.isEmpty  {
                }
                else{
                    let detail = datadetails[indexPath.row]
                    let images = dataimage[indexPath.row]
                    
                    //文字
                    cell.lable_sender.text = detail![3]["sendername"]
                    cell.UILabel_Detail.text = detail![5]["detail"]
                    cell.UILabel_Time.text = detail![0]["newstime"]! + " 来自" + detail![1]["device"]!
                    
                    //图片
                    if images?.count == 2 {
                        for i in 0..<2 {
                            Alamofire.request(.GET, server + images![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView_Main1.image = image
                                        case 1:cell.UIImageView_Main2.image = image
                                        default: break
                                        }
                                        
                                    }
                            }
                        }
                    }
                    
                    if images?.count == 3 {
                        for i in 0..<3 {
                            Alamofire.request(.GET, server + images![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView_Main1.image = image
                                        case 1:cell.UIImageView_Main2.image = image
                                        case 2:cell.UIImageView_Main3.image = image
                                        default: break
                                        }
                                        
                                    }
                            }
                        }
                    }
                    
                    cell.UIImageView_BackGround.image = ImageloadBackGroudn
                    cell.image_left_top.image = Imageload
                    cell.image_right_top.image = Imageloadw
                    
                    height_tableview = CGFloat(cell.Guding_Height) + ( screenBounds - 10 ) / 3 + 60
                }
                return cell
                
                
            case "Suit_4_5_6_photos"://
                //print("Suit_4_5_6_photos")
                let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFrist456TableViewCell", forIndexPath: indexPath) as! FFrist456TableViewCell
                if datadetails.isEmpty || dataimage.isEmpty {
                }
                else{
                    let detail = datadetails[indexPath.row]
                    let images = dataimage[indexPath.row]
                    
                    //文字
                    cell.Lable_sender.text = detail![3]["sendername"]
                    cell.Lable_others.text = detail![5]["detail"]
                    cell.Label_Time.text = detail![0]["newstime"]! + " 来自" + detail![1]["device"]!
                    
                    //图片
                    if images?.count == 4 {
                        for i in 0..<4 {
                            Alamofire.request(.GET, server + images![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.Image1.image = image
                                        case 1:cell.Image2.image = image
                                        case 2:cell.Image3.image = image
                                        case 3:cell.Image4.image = image
                                        default: break
                                        }
                                    }
                            }
                        }
                    }
                    
                    if images?.count == 5 {
                        for i in 0..<5 {
                            Alamofire.request(.GET, server + images![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.Image1.image = image
                                        case 1:cell.Image2.image = image
                                        case 2:cell.Image3.image = image
                                        case 3:cell.Image4.image = image
                                        case 4:cell.Image5.image = image
                                        default: break
                                        }
                                    }
                            }
                        }
                    }
                    
                    if images?.count == 6 {
                        for i in 0..<6 {
                            Alamofire.request(.GET, server + images![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.Image1.image = image
                                        case 1:cell.Image2.image = image
                                        case 2:cell.Image3.image = image
                                        case 3:cell.Image4.image = image
                                        case 4:cell.Image5.image = image
                                        case 5:cell.Image6.image = image
                                        default: break
                                        }
                                    }
                            }
                        }
                    }
                    
                    cell.UIImageView_Background.image = ImageloadBackGroudn
                    cell.Image_top_left.image = Imageload
                    cell.Image_top_right.image = Imageloadw
                    
                    height_tableview = CGFloat(cell.Guding_Height) + ( screenBounds - 10 ) / 3 * 2 + 60
                }
                return cell
                
            case "Suit_7_8_9_photos"://
                //print("Suit_7_8_9_photos")
                let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFrist789TableViewCell", forIndexPath: indexPath) as! FFrist789TableViewCell
                if datadetails.isEmpty || dataimage.isEmpty {
                }
                else{
                    let detail = datadetails[indexPath.row]
                    let images = dataimage[indexPath.row]
                    
                    //文字
                    cell.UILabel_Sender.text = detail![3]["sendername"]
                    cell.UILabel_Detail.text = detail![5]["detail"]
                    cell.UILabel_Time.text = detail![0]["newstime"]! + " 来自" + detail![1]["device"]!
                    
                    //图片
                    if images?.count == 7 {
                        for i in 0..<7 {
                            Alamofire.request(.GET, server + images![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView_Main1.image = image
                                        case 1:cell.UIImageView_Main2.image = image
                                        case 2:cell.UIImageView_Main3.image = image
                                        case 3:cell.UIImageView_Main4.image = image
                                        case 4:cell.UIImageView_Main5.image = image
                                        case 5:cell.UIImageView_Main6.image = image
                                        case 6:cell.UIImageView_Main7.image = image
                                        default: break
                                        }
                                    }
                            }
                        }
                    }
                    
                    if images?.count == 8 {
                        for i in 0..<8 {
                            Alamofire.request(.GET, server + images![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView_Main1.image = image
                                        case 1:cell.UIImageView_Main2.image = image
                                        case 2:cell.UIImageView_Main3.image = image
                                        case 3:cell.UIImageView_Main4.image = image
                                        case 4:cell.UIImageView_Main5.image = image
                                        case 5:cell.UIImageView_Main6.image = image
                                        case 6:cell.UIImageView_Main7.image = image
                                        case 7:cell.UIImageView_Main8.image = image
                                        default: break
                                        }
                                    }
                            }
                        }
                    }
                    
                    if images?.count == 9 {
                        for i in 0..<9 {
                            Alamofire.request(.GET, server + images![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView_Main1.image = image
                                        case 1:cell.UIImageView_Main2.image = image
                                        case 2:cell.UIImageView_Main3.image = image
                                        case 3:cell.UIImageView_Main4.image = image
                                        case 4:cell.UIImageView_Main5.image = image
                                        case 5:cell.UIImageView_Main6.image = image
                                        case 6:cell.UIImageView_Main7.image = image
                                        case 7:cell.UIImageView_Main8.image = image
                                        case 8:cell.UIImageView_Main9.image = image
                                        default: break
                                        }
                                    }
                            }
                        }
                    }
                    
                    cell.UIImageView_Backgroud.image = ImageloadBackGroudn
                    cell.UIImageView_Top_Left.image = Imageload
                    cell.UIImageView_Top_Right.image = Imageloadw
                    
                    height_tableview = CGFloat(cell.Guding_Height) + ( screenBounds - 10 ) + 60
                }
                return cell
            case "Suit_more_than_10_photos":
                break
            default:
                break
            }
            
        }

        let cell = TimeTableView.dequeueReusableCellWithIdentifier("FFrist_1_big_TableViewCell", forIndexPath: indexPath) as! FFrist_1_big_TableViewCell
    
        return cell
        

        
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
        return false
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
    
    //MARK:Others
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

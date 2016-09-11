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
import SVProgressHUD

//Tab bar我的页面
class FFristViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    //MARK: - Data
    
    @IBOutlet weak var TimeTableView: UITableView!
    
    var Tableview_count:Int = 0
    var shifoudenglu :NSString = ""
    
    var listItems  = [NSManagedObject]()

    //用两个Dictionary来存储下载下来的数据
    //同样猪标记符的是一组数据，dataimage是图片，datadetails是文字
    //从字典标识符1开始存储 ，0 表示不存在数据
    
    
    //肌肤默认的图片
    var Imageload:Image = UIImage(named: "Black.png")!
    var Imageloadw:Image = UIImage(named: "White.png")!
    var ImageloadBackGroud:Image = UIImage(named: "FirstBackGround.png")!
    var ImageloadBackGroudn:Image = UIImage(named: "BackGround.png")!
    
    
    var height_tableview:CGFloat = 0 //tableviewcell 的高度
    var ShiFou_QingQiuDao_ShuJu = true
    
    var SheBei_Width = UIScreen.mainScreen().bounds.width
    var server:String = ""
    var serverimage:String = ""
    var servericon = ""
    
    
    
    //MARK: - DATA SAVE
    
    /*
     存储了一条多信息数据
        1、信息的发送时间
        2、发送的设备
        3、发送者的 ID
        4、发送者的 NAME
        5、风格
        6、详情
        7、信息 ID
     按序号排列，（序号，【一个数组《字典中用一个键值对：信息名：信息》】）
     */
    var datadetails = Dictionary<Int,[Dictionary<String,String>]>()
    
    /*
     存储一组图片名称
     按序号排列 【一个数组《字典键值对：这里的图片名称：图片名称》】
     */
    var dataimage   = Dictionary<Int,[Dictionary<String,String>]>()
    
    /*
     存储一组图片
     按序号排列 【一个数组《字典键值对：这里的图片名称：图片 image》】
     */
    var image       = Dictionary<Int,[Dictionary<String,Image >]>()
    
    /*
     相同序号表示同一组数据
     datadetails\dataimage\image 添加数据的时候都是要从头部添加数据 保持数据准确的按照时间来排列顺序
        【时间顺序：服务器查询的时候 应该先排序 然后再查询 保证返回数据的顺序是按照时间先后来排列的】
     比同：
        【下拉刷新的请求：要携带现在存储的最新的一条数据的 ID。】
        【             我们这是一个类似于微博的项目，要求“所有”的数据都要请求下来。】
     */
    
    //MARK: - ButtonClick
    
    //扫一扫
    @IBAction func Sao_yi_sao(sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SettingTableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //发动态
    @IBAction func Send_Dongtai(sender: AnyObject) {
        
        //let sb = UIStoryboard(name: "Frist", bundle:nil)
        //let vc = sb.instantiateViewControllerWithIdentifier("Send_News_TableViewController") as UIViewController
        //self.presentViewController(vc, animated: true, completion: nil)
        
        let vc = UIStoryboard(name: "Frist", bundle: nil).instantiateViewControllerWithIdentifier("Send_News_TableViewController")
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
    
    
    //MARK: - View
    
    
//    override func viewWillAppear(animated: Bool) {
//        print("viewWillAppear")
//    }
//    
//    override func viewDidAppear(animated: Bool) {
//        print("viewDidAppear")
//    }
//    
//    override func viewWillDisappear(animated: Bool) {
//        print("viewWillDisappear")
//    }
//    
//    override func viewDidDisappear(animated: Bool) {
//       print("viewDidDisappear")
//    }
    
    override func viewDidLoad() {
        
        //MARK:
        let imgbackV = UIImageView(image: ImageloadBackGroudn)
        self.TimeTableView.backgroundView = imgbackV
        
        for a in 0...10 {
            print(a)
            saveItem(String(a))
        }
        

        
        TimeTableView.dataSource = self
        TimeTableView.delegate = self
        
        //读取plist数据，用户是否登录
        let diaryList:String = NSBundle.mainBundle().pathForResource("/Server", ofType:"plist")!
        let data:NSMutableDictionary = NSMutableDictionary(contentsOfFile:diaryList)!
        server = data.objectForKey("Server") as! String
        serverimage = server + "photo/TEST_PHOTOS/"
        servericon = server + "photo/USER_ICONS/"
        
        print(serverimage)
        //MARK:ALAMOFIRE START
        
        Alamofire.request(.GET, server + "/GIVE_BACK_PHOTO.php",parameters: ["data": "bar"])
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Dark)//前后颜色
                    SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.Native)//菊花
                    SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
                    SVProgressHUD.show()

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
                        SVProgressHUD.dismiss()
                    }
                case .Failure(let error):
                    self.ShiFou_QingQiuDao_ShuJu = false
                    print(error)
                }
        }
        

        //MARK: BASE64 INCODE
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
        super.viewDidLoad()
    }
    //////////////////tableView_start

    
    
    //MARK: - Tableview
    
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
        if !datadetails.isEmpty && indexPath.row == 0 {
            let newstime  :String = datadetails[indexPath.section]![0]["newstime"]!
            let device    :String = datadetails[indexPath.section]![1]["device"]!
            let sendername:String = datadetails[indexPath.section]![3]["sendername"]!
            let detail    :String = datadetails[indexPath.section]![5]["detail"]!
            let newsid    :String = datadetails[indexPath.section]![6]["newsid"]!
            let photonumber:Int   = (dataimage[indexPath.section]?.count)!
            
            NSUserDefaults.standardUserDefaults().setObject(newstime, forKey: "newstime")
            NSUserDefaults.standardUserDefaults().setObject(device, forKey: "device")
            NSUserDefaults.standardUserDefaults().setObject(sendername, forKey: "sendername")
            NSUserDefaults.standardUserDefaults().setObject(detail, forKey: "detail")
            NSUserDefaults.standardUserDefaults().setObject(newsid, forKey: "newsid")
            NSUserDefaults.standardUserDefaults().setObject(photonumber, forKey: "photonumber")
            
            //设置同步
            NSUserDefaults.standardUserDefaults().synchronize()
            //跳转
            let vc = UIStoryboard(name: "Frist", bundle: nil).instantiateViewControllerWithIdentifier("NewsDetailTableViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        //=========================//
        //图片行
        if  indexPath.row == 1 && !dataimage[indexPath.section]!.isEmpty {
            let imagelist  = dataimage[indexPath.section]!
            
            NSUserDefaults.standardUserDefaults().setObject(imagelist, forKey: "imagelist")
            //设置同步
            NSUserDefaults.standardUserDefaults().synchronize()
            //跳转
            let vc = UIStoryboard(name: "Frist", bundle: nil).instantiateViewControllerWithIdentifier("ShowPhtoto_ViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
        if datadetails.count == 0 {
            return 1
        }
        return datadetails.count
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    //几个Tableview cell
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("几个Tableview cell")
        return 3
    }
    
    //Tableview初始化
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /*
         indexPath.row 是从 “0” 开始的
         /*
         这里应该是这么几种不同的载入方式的数据
         适用于 9，8，7等长宽 图片的载入方式
         适用于 6，5，4等长宽 图片的载入方式.
         适用于 3，2等长宽 图片的载入方式.
         适用于 黄金比例 竖向 2图片的载入方式
         适用于 黄金比例 横向 1图片的载入方式.
         */
            黄金比例：0.618
        */
        // 当datadetails 等于 空 没有数据的时候 用某某缩略图填充一下  感觉就像 Facebook了
        if  datadetails.isEmpty  {
            let cell = TimeTableView.dequeueReusableCellWithIdentifier("Information_TableViewCell", forIndexPath: indexPath) as! Information_TableViewCell
            cell.UIImageView_Background.image = ImageloadBackGroud
            
            cell.UIImageView_UserIcon.hidden = true
            cell.UIImageView_Setting.hidden = true
            cell.UILabel_SenderName.hidden = true
            cell.UILabel_Information.hidden = true
            cell.UILabel_MainDetail.hidden = true
            
            height_tableview = ( SheBei_Width - 10 ) * 0.618  + 5
            
            return cell
        } else {
            //现在我们有数据 那就展示出来吧
            switch indexPath.row {
            case 0://第一部分：文字组合
                let cell = TimeTableView.dequeueReusableCellWithIdentifier("Information_TableViewCell", forIndexPath: indexPath) as! Information_TableViewCell
                
                cell.UIImageView_UserIcon.hidden = false
                cell.UIImageView_Setting.hidden = false
                
                cell.UILabel_SenderName.hidden = false
                cell.UILabel_Information.hidden = false
                cell.UILabel_MainDetail.hidden = false
                
                cell.UIImageView_Background.hidden = true
                
                //cell.UIImageView_UserIcon.image = Imageload
                
                Alamofire.request(.GET, servericon + datadetails[indexPath.section]![2]["senderid"]! + ".png")
                    .responseImage { response in
                        if let image = response.result.value {
                            cell.UIImageView_UserIcon.image = image
                        }
                }
                cell.UIImageView_Setting.image = Imageload
                
                cell.UILabel_SenderName.text = datadetails[indexPath.section]![3]["sendername"]
                let aa = datadetails[indexPath.section]![0]["newstime"]!
                
                let date = NSDate()
                let formatter = NSDateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let dateString = formatter.stringFromDate(date)
                //let dateString = "9999-12-31 22:38:00"
                //print(dateString)
                
                var time1 = ["","","","",""]
                var time2 = ["","","","",""]
                
                var flag1 = 0
                var flag2 = 0
                
                
                
                for (i) in (aa.characters) {
                    //发送时间
                    switch flag1 {
                    case 0,1,2,3:
                        time1[0].append(i)
                    case 5,6:
                        time1[1].append(i)
                    case 8,9:
                        time1[2].append(i)
                    case 11,12:
                        time1[3].append(i)
                    case 14,15:
                        time1[4].append(i)
                    default:
                        break
                    }
                    flag1 += 1
                }
                
                for (i) in (dateString.characters) {
                    //系统时间
                    switch flag2 {
                    case 0,1,2,3:
                        time2[0].append(i)
                    case 5,6:
                        time2[1].append(i)
                    case 8,9:
                        time2[2].append(i)
                    case 11,12:
                        time2[3].append(i)
                    case 14,15:
                        time2[4].append(i)

                    default:
                        break
                    }
                    flag2 += 1
                }
                
                if time1[0] == time2[0] && time1[1] == time2[1] && time1[2] == time2[2]{
                    //同一天
                    if  Int(time1[3])! - Int(time2[3])! == 0 ||   Int(time1[3])! - Int(time2[3])! == 1 ||  Int(time1[3])! - Int(time2[3])! == -1 {
                        //小时一样 或接近
                        cell.UILabel_Information.text = "刚刚" + "  来自" + datadetails[indexPath.section]![1]["device"]!
                    }
                    else{
                        cell.UILabel_Information.text = "今天" + "  来自" + datadetails[indexPath.section]![1]["device"]!
                    }
                    
                }
                else{
                    cell.UILabel_Information.text = time1[0] + "年" + time1[1] + "月" + time1[2] + "日 " + time1[3] + "时" + time1[4] + "分" + "  来自" + datadetails[indexPath.section]![1]["device"]!
                }
                
                
                cell.UILabel_MainDetail.text = datadetails[indexPath.section]![5]["detail"]
                
                let A = datadetails[indexPath.section]![5]["detail"]!
                var o = 0
                
                //文字是14号字体
                //固定高度 10 + 45 + 5 + ？ + 10
                switch LoadTableViewCells().getDeviceVersion() {
                case "iPhone SE","iPhone 5","iPhone 5S","iPhone 5C":
                    o = (A.characters.count - A.characters.count % 22) / 22 + 1
                case "iPhone 6" ,"iPhone 6S":
                    o = (A.characters.count - A.characters.count % 26) / 26 + 1
                case "iPhone 6 Plus","iPhone 6s Plus":
                    o = (A.characters.count - A.characters.count % 28) / 28 + 1
                default:
                    o = (A.characters.count - A.characters.count % 22) / 22 + 1
                }
            
                height_tableview = 75 + CGFloat( 20 * o)
                return cell
            case 1://第二部分：照片
                switch dataimage[indexPath.section]!.count {
                case 1:
                    //判断得到的图片的高度 宽度比值
                    //确定样式
                    let cell = TimeTableView.dequeueReusableCellWithIdentifier("OnePhoto_H_TableViewCell", forIndexPath: indexPath) as! OnePhoto_H_TableViewCell
                    
                    Alamofire.request(.GET, serverimage + dataimage[indexPath.section]![0]["Photo1"]!)
                        .responseImage { response in
                            if let image = response.result.value {
                                //cell.UIButton_Main.setBackgroundImage(image, forState: .Normal)
                                cell.UIImageView_Main.image = image
                            }
                    }
                    
                    height_tableview = SheBei_Width * 0.618
                    return cell

                case 2,3:
                    let cell = TimeTableView.dequeueReusableCellWithIdentifier("TwoThreePhoto_TableViewCell", forIndexPath: indexPath) as! TwoThreePhoto_TableViewCell
                    //cell.UIButton_1.setTitle("", forState: .Normal)

                    switch dataimage[indexPath.section]!.count {
                    case 2:
                        for i in 0..<2 {
                            Alamofire.request(.GET, serverimage + dataimage[indexPath.section]![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView1.image = image
                                        case 1:cell.UIImageView2.image = image
                                        default: break
                                        }
                                    }
                            }
                        }
                    default:
                        for i in 0..<3 {
                            Alamofire.request(.GET, serverimage + dataimage[indexPath.section]![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView1.image = image
                                        case 1:cell.UIImageView2.image = image
                                        case 2:cell.UIImageView3.image = image
                                        default: break
                                        }
                                    }
                            }
                        }

                    }
                    
                    height_tableview = SheBei_Width / 3
                    return cell

                case 4,5,6:
                    let cell = TimeTableView.dequeueReusableCellWithIdentifier("FourFiveSixPhoto_TableViewCell", forIndexPath: indexPath) as! FourFiveSixPhoto_TableViewCell

                    switch dataimage[indexPath.section]!.count {
                    case 4:
                        for i in 0..<4 {
                            Alamofire.request(.GET, serverimage + dataimage[indexPath.section]![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView_1.image = image
                                        case 1:cell.UIImageView_2.image = image
                                        case 2:cell.UIImageView_3.image = image
                                        case 3:cell.UIImageView_4.image = image
                                        default: break
                                        }
                                    }
                            }
                        }

                    case 5:
                        for i in 0..<5 {
                            Alamofire.request(.GET, serverimage + dataimage[indexPath.section]![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView_1.image = image
                                        case 1:cell.UIImageView_2.image = image
                                        case 2:cell.UIImageView_3.image = image
                                        case 3:cell.UIImageView_4.image = image
                                        case 4:cell.UIImageView_5.image = image
                                        default: break
                                        }
                                    }
                            }
                        }

                    default:
                        for i in 0..<6 {
                            Alamofire.request(.GET, serverimage + dataimage[indexPath.section]![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView_1.image = image
                                        case 1:cell.UIImageView_2.image = image
                                        case 2:cell.UIImageView_3.image = image
                                        case 3:cell.UIImageView_4.image = image
                                        case 4:cell.UIImageView_5.image = image
                                        case 5:cell.UIImageView_6.image = image
                                        default: break
                                        }
                                    }
                            }
                        }

                    }
                    
                    height_tableview = SheBei_Width / 3 * 2
                    return cell

                case 7,8,9:
                    let cell = TimeTableView.dequeueReusableCellWithIdentifier("SevenEightNinePhoto_TableViewCell", forIndexPath: indexPath) as! SevenEightNinePhoto_TableViewCell
                    
                    switch dataimage[indexPath.section]!.count {
                    case 7:
                        for i in 0..<7 {
                            Alamofire.request(.GET, serverimage + dataimage[indexPath.section]![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView_1.image = image
                                        case 1:cell.UIImageView_2.image = image
                                        case 2:cell.UIImageView_3.image = image
                                        case 3:cell.UIImageView_4.image = image
                                        case 4:cell.UIImageView_5.image = image
                                        case 5:cell.UIImageView_6.image = image
                                        case 6:cell.UIImageView_7.image = image
                                        default: break
                                        }
                                    }
                            }
                        }
                        
                    case 8:
                        for i in 0..<8 {
                            Alamofire.request(.GET, serverimage + dataimage[indexPath.section]![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView_1.image = image
                                        case 1:cell.UIImageView_2.image = image
                                        case 2:cell.UIImageView_3.image = image
                                        case 3:cell.UIImageView_4.image = image
                                        case 4:cell.UIImageView_5.image = image
                                        case 5:cell.UIImageView_6.image = image
                                        case 6:cell.UIImageView_7.image = image
                                        case 7:cell.UIImageView_8.image = image
                                        default: break
                                        }
                                    }
                            }
                        }
                        
                    default:
                        for i in 0..<9 {
                            Alamofire.request(.GET, serverimage + dataimage[indexPath.section]![i]["Photo" + String(i + 1)]!)
                                .responseImage { response in
                                    if let image = response.result.value {
                                        switch i{
                                        case 0:cell.UIImageView_1.image = image
                                        case 1:cell.UIImageView_2.image = image
                                        case 2:cell.UIImageView_3.image = image
                                        case 3:cell.UIImageView_4.image = image
                                        case 4:cell.UIImageView_5.image = image
                                        case 5:cell.UIImageView_6.image = image
                                        case 6:cell.UIImageView_7.image = image
                                        case 7:cell.UIImageView_8.image = image
                                        case 8:cell.UIImageView_9.image = image

                                        default: break
                                        }
                                    }
                            }
                        }
                        
                    }

                    
                    height_tableview = SheBei_Width
                    return cell

                default:
                    let cell = TimeTableView.dequeueReusableCellWithIdentifier("Information_TableViewCell", forIndexPath: indexPath) as! Information_TableViewCell
                    
                    height_tableview = 100
                    return cell

                }
            case 2://第三部分：评论等
                let cell = TimeTableView.dequeueReusableCellWithIdentifier("PinglunZanO_TableViewCell", forIndexPath: indexPath) as! PinglunZanO_TableViewCell
                cell.UIButton1.setTitle("评论" + String(cell.Pinglun_NUM), forState:.Normal)
                
                cell.UIButton2.setTitle("赞" + String(cell.Zan_NUM), forState:.Normal)
                
                cell.UIButton3.setTitle("踩" + String(cell.Cai_NUM), forState:.Normal)
                
                height_tableview = 55
                return cell
            default:
                let cell = TimeTableView.dequeueReusableCellWithIdentifier("Information_TableViewCell", forIndexPath: indexPath) as! Information_TableViewCell
                
                height_tableview = 100
                return cell
            }
        }
        
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

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

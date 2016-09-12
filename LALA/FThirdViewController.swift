//
//  FThirdViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/7/29.
//  Copyright © 2016 Thomas Liu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import AlamofireImage
import Alamofire
import CoreData
import Foundation
import SwiftyJSON

//Tab bar发现页面
class FThirdViewController: UIViewController {
    
    
    @IBOutlet weak var Top_Search_TextField: UITextField!
    
    @IBOutlet weak var UIImageView_AD: UIImageView!
    
    @IBAction func SpaceClick(sender: AnyObject) {
        Top_Search_TextField.resignFirstResponder();
    }

    @IBAction func ShuRuWanBi_Search(sender: AnyObject) {
        
        if Top_Search_TextField.text != nil {
            let dataaaaaaaaa = Top_Search_TextField.text!
            var type = ""
            
            //判断是不是邮箱
            var ATnumber = 0
            var dotnumber = 0
        
            for i in dataaaaaaaaa.characters {
                if i == "@" {
                    ATnumber += 1
                }
                if i == "." {
                    dotnumber += 1
                }
            }
            
            if ATnumber == 1 && dotnumber == 1 {
                print("email")
                type = "email"
                //转移
            }
            //判断是不是手机号
            var datanumber = 0
            var num_num = 0
            
            
            for i in dataaaaaaaaa.characters {
                datanumber += 1
                switch i {
                case "1","2","3","4","5","6","7","8","9","0":
                    num_num += 1
                default:
                    break
                }
            }
            if datanumber == 11 && num_num == 11 {
                print("phone")
                type = "phone"
                //转移
                
            }
            //如果都不是 报错误
            if type == ""  {
                //让用户输入正确的
                if Top_Search_TextField.text == "" {
                    print("空")
                    print(Top_Search_TextField.placeholder!)
                    //TuijianViewController
                    let vc = UIStoryboard(name: "Thrid", bundle: nil).instantiateViewControllerWithIdentifier("TuijianViewController")
                    self.navigationController?.pushViewController(vc, animated: true)

                } else {
                    print("啥都不是啊兄弟")
                }
            }
        }
        else
        {
            //让用户输入正确的
        }
        
        //print(isTelNumber("17863950052"))
    }
    
    ///////////////////////以下不重要、、/////////////////
    func isTelNumber(num:NSString)->Bool
    {
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluateWithObject(num) == true)
            || (regextestcm.evaluateWithObject(num)  == true)
            || (regextestct.evaluateWithObject(num) == true)
            || (regextestcu.evaluateWithObject(num) == true))
        {
            print(num)
            return true
        }
        else
        {
            print(num)
            return false
        }
        
        
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.title = "发现"
        Top_Search_TextField.placeholder = "来呀来呀"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //获取Plist中的数据
//    @IBAction func CoreDaraClick(sender: AnyObject) {
//        print("点击了plist")
//        //读取数据/
//        let diaryList:String = NSBundle.mainBundle().pathForResource("/Shi_Fou_Deng_Lu", ofType:"plist")!
//        print(diaryList)
//        let data:NSMutableDictionary = NSMutableDictionary(contentsOfFile:diaryList)!
//        let da:NSString = data.objectForKey("username") as! NSString
//        
//        print("现在的数据是"+(da as String))
//        pl.text = da as String
//        
//        //写入数据
//        //手机上不可实现
//        let plistpath:NSString = NSBundle.mainBundle().pathForResource("/Shi_Fou_Deng_Lu", ofType:"plist")!
//        print(plistpath)
//        let usersdic:NSMutableDictionary = NSMutableDictionary(contentsOfFile:plistpath as String)!
//        usersdic.setObject("Tang", forKey: "username")
//        usersdic.writeToFile(plistpath as String,atomically: true)
//        
//        print("把Tang写进去了?")
//        print("")
//        
//    }
}

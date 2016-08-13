//
//  FThirdViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/7/29.
//  Copyright © 2016 Thomas Liu. All rights reserved.
//

import UIKit
import Alamofire
import CoreData
import Foundation


//Tab bar发现页面
class FThirdViewController: UIViewController {
    
    @IBOutlet weak var pl: UILabel!
    
    @IBOutlet weak var Top_Search_TextField: UITextField!
    
    var managedObjectContext = true
    
    @IBAction func SpaceClick(sender: AnyObject) {
        Top_Search_TextField.resignFirstResponder();
    }
    
    
    
    
    //长按时间
    @IBAction func LLLPP(sender: AnyObject) {
        print("LLLLPPP")
    }
    //获取Plist中的数据
    @IBAction func CoreDaraClick(sender: AnyObject) {
        print("点击了plist")
        //读取数据
        let diaryList:String = NSBundle.mainBundle().pathForResource("/Shi_Fou_Deng_Lu", ofType:"plist")!
        let data:NSMutableDictionary = NSMutableDictionary(contentsOfFile:diaryList)!
        let da:NSString = data.objectForKey("username") as! NSString
        
        print("现在的数据是"+(da as String))
        pl.text = da as String
        
        //写入数据
        //手机上不可实现
        let plistpath:NSString = NSBundle.mainBundle().pathForResource("/Shi_Fou_Deng_Lu", ofType:"plist")!
        let usersdic:NSMutableDictionary = NSMutableDictionary(contentsOfFile:plistpath as String)!
        usersdic.setObject("Tang", forKey: "username")
        usersdic.writeToFile(plistpath as String,atomically: true)
        
        print("把Tang写进去了?")
        print("")
        
    }

    //CoreData按钮的点击
    //这里将是Coredata的试验场
    @IBAction func CoreData(sender: AnyObject) {
        print("点击了Coredata按钮")
        //文件名：Data 表名：User 字段：userid
        
        print(funccccccc().InnnnnnnnnCoreDataSimida("", B: ""))
        
        //写入：感觉需要写一个方法
        
        //读取：同样的需要写一个方法

        }
    
    func InnnnnnnnnCoreDataSimida1(A:String) -> Int {
        return 1
    }
    
    func InnnnnnnnnCoreDataSimida1(A:String,B:String) -> Int {
        return 1
    }
    
    
    ///////////////////////以下不重要、、/////////////////
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

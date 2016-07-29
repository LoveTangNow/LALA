//
//  SecondSonViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/7/29.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import Alamofire

class SecondSonViewController: UIViewController {
    
    var datall:String = ""
    
    
    @IBOutlet weak var Lable: UILabel!

    @IBAction func btnClick(sender: AnyObject) {
        print("data       "+connect())
        
//        let strArray = datall.componentsSeparatedByString(",")
//        for u in strArray {
//            print(u)
//        }
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController!.interactivePopGestureRecognizer!.enabled = true;
        // Do any additional setup after loading the view.
        
        //设置Label的test
        Lable.text = "哈哈"
        connect()
        testJson()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    MARK: - Navigation
     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func connect () -> String{
        Alamofire.request(.GET, "http://localhost:80/test2/Afiretest.php",parameters: ["data": "bar"])
            .validate()
            .responseString { response in
                //print("Success: \(response.result.isSuccess)")
                //print("Response String: \(response.result.value)");
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    self.datall = JSON
                }
            }.responseJSON { response in
                print("Response JSON: \(response.result.value)")
        }
        return datall
        
    }
    
    func testJson() {
        //Swift对象
//        let user = [
//            "uname": "张三",
//            "tel": ["mobile": "138", "home": "010"]
//        ]
        //首先判断能不能转换
        
        let user = (datall)
        
        if (!NSJSONSerialization.isValidJSONObject(user)) {
            print("is not a valid json object")
            return
        }
        //利用OC的json库转换成OC的NSData，
        //如果设置options为NSJSONWritingOptions.PrettyPrinted，则打印格式更好阅读
        let data : NSData! = try? NSJSONSerialization.dataWithJSONObject(user, options: [])
        //NSData转换成NSString打印输出
        let str = NSString(data:data, encoding: NSUTF8StringEncoding)
        //输出json字符串
        print("Json Str:"); print(str)
        
        //把NSData对象转换回JSON对象
        let json : AnyObject! = try? NSJSONSerialization
            .JSONObjectWithData(data, options:NSJSONReadingOptions.AllowFragments)
        print("Json Object:"); print(json)
        //验证JSON对象可用性
        let uname : AnyObject = json.objectForKey("uname")!
        let mobile : AnyObject = json.objectForKey("tel")!.objectForKey("mobile")!
        print("get Json Object:");
        print("uname: \(uname), mobile: \(mobile)")
    }


}

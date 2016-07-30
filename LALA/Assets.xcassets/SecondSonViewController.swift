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
    var clickNum:Int = 0
    
    
    @IBOutlet weak var Lable: UILabel!

    @IBAction func b3c(sender: AnyObject) {
        //connect("http://localhost:80/test2/test.php")
        
    }
    @IBAction func btnClick(sender: AnyObject) {
        if clickNum == 0  {
            print("data       "+connect("http://localhost:80/test2/Afiretest.php"))
            clickNum += 1
        }
        else
        {
            print("data       "+connect("http://localhost:80/test2/Afiretest.php"))
            let t = JAS(datall)
            for (a,b) in t {
                print("键="+a+"     值="+b)
            }
            clickNum -= 1
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.interactivePopGestureRecognizer!.enabled = true;
        // Do any additional setup after loading the view.
        //设置Label的test
        Lable.text = "哈哈"
        connect("http://localhost:80/test2/Afiretest.php")
        
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
    
    
    func connect (A:String) -> String{
        Alamofire.request(.GET, A,parameters: ["data": "bar"])
            .validate()
            .responseString { response in
                //print("Success: \(response.result.isSuccess)")
                //print("Response String: \(response.result.value)");
                
                if let JSON = response.result.value {
                    //print("JSON: \(JSON)")
                    self.datall = JSON
                }
            }.responseJSON { response in
                print("Response JSON: \(response.result.value)")
        }
        return datall
    }
    
    
    
    //解析特定的格式Json数据 如{"a":"1","b":"2","c":"3","d":"4","e":"5"}
    func JAS(A:String)  -> Dictionary<String, String>{
        
        var woshiyigekongzidian = Dictionary<String, String>()
        var data:String = ""
        if (A != "") {
            data = A
        }
        else{
            return woshiyigekongzidian
        }
        var strArray = data.componentsSeparatedByString(",")
        //将data分解成数组，用strArray存贮
        //我们要将第一个和最后一个有括号的做处理
        let strArray_changdu = strArray.endIndex.advancedBy(-0)
        for j in 0..<strArray_changdu
        {
            //把strArray分割
            var strArraychind0 = strArray[j].componentsSeparatedByString("\"")
            //计算长度
            let strArraychind0_changdu = strArraychind0.endIndex.advancedBy(-0)
            //去首去尾
            strArraychind0.removeAtIndex(strArraychind0_changdu-1)
            strArraychind0.removeAtIndex(0)
            //再次计算长度
            let strArraychind0_changdu2 = strArraychind0.endIndex.advancedBy(-0)
            //下面就是组装了
            var zhuzhuang = ""
            for i in 0..<strArraychind0_changdu2
            {
                zhuzhuang = zhuzhuang + strArraychind0[i]
            }
            //组装完成之后，传出来
            strArray[j] = zhuzhuang
            
        }
        let strArray_changdu2 = strArray.endIndex.advancedBy(-0)
        for jj in 0..<strArray_changdu2
        {
            //子项分割为更小想们 访入strArraychind00
            var strArraychind00 = strArray[jj].componentsSeparatedByString(":")
            woshiyigekongzidian[strArraychind00[0]] = strArraychind00[1]
        }
        return woshiyigekongzidian
    }

}

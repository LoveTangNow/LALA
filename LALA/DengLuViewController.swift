//
//  DengLuViewController.swift
//  Link_Now
//
//  Created by Thomas Liu on 16/8/6.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class DengLuViewController: UIViewController {
    
    @IBOutlet weak var username_space: UITextField!
    @IBOutlet weak var userpassword_space: UITextField!
    
    //收起键盘：空白
    @IBAction func SpaceClick(sender: AnyObject) {
        username_space.resignFirstResponder()
        userpassword_space.resignFirstResponder()
    }

    /*
     用户名（邮箱，手机）点击事件
     右下角按钮文字应为：Next，如果有可能的话可以使用汉字：下一个
     功能：跳转到 焦点在password上
     
     额外功能
     提示：提示邮箱
     包括qq啊，gmail啊之类的
     提示功能应该是在 内容更改的事件中，不应该是在现在的点击事件之中，有待讨论。
     */
    
    @IBAction func Username_click(sender: AnyObject) {
        
    }
    
    /*
     密码框点击事件
     右下角按钮为：Go
     功能：和登录按钮的功能一样，就是登录
     */
    
    
    @IBAction func Goooooooo(sender: AnyObject) {
        print(zhu_ce())
    }
    

    //登录按钮点击事件
    @IBAction func denglu_button(sender: AnyObject) {
        print(zhu_ce())
    }
    

    //没有账号按钮点击事件
    @IBAction func zhuce_dianji_button(sender: AnyObject) {
        
        print("还没有账号,点这里")
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("ZhuCeViewController") as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }

    //注册的逻辑？
    func zhu_ce() -> Int {
        return 1;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username_space.placeholder = "请输入邮箱或手机号"
        userpassword_space.placeholder = "请输入密码"
        self.title = "登录"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

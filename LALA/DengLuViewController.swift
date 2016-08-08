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
    
    //收起键盘：空白，用户名
    @IBAction func SpaceClick(sender: AnyObject) {
        username_space.resignFirstResponder()
        userpassword_space.resignFirstResponder()
    }
    
    //
    @IBAction func Goooooooo(sender: AnyObject) {
        print(zhu_ce())
    }
    

    @IBAction func denglu_button(sender: AnyObject) {
        print(zhu_ce())
    }
    

    @IBAction func zhuce_dianji_button(sender: AnyObject) {
        
        print("还没有账号,点这里")
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewControllerWithIdentifier("ZhuCeViewController") as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }

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

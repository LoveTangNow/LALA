//
//  ZhuCeViewController.swift
//  Link_Now
//
//  Created by Thomas Liu on 16/8/6.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class ZhuCeViewController: UIViewController {
    
    
    @IBOutlet weak var user_email: UITextField!
    @IBOutlet weak var user_phone: UITextField!
    
    @IBOutlet weak var user_password: UITextField!
    @IBOutlet weak var user_password_c: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        user_email.placeholder = "邮箱"
        user_phone.placeholder = "手机号"
        user_password.placeholder = "密码"
        user_password_c.placeholder = "确认密码"

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Zhuce_Click(sender: AnyObject) {
        print("点了注册按钮")
        self.dismissViewControllerAnimated(true, completion:nil)
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

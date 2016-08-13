//
//  SendNewsViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/13.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class SendNewsViewController: UIViewController {
    
    @IBOutlet weak var UITextView_M: UITextView!
    
    @IBAction func printerrrrr(sender: AnyObject) {
        print(UITextView_M.text)
    }
    
    @IBAction func Shoujianpan(sender: AnyObject) {
        UITextView_M.resignFirstResponder()
        
        //var a =
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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

//
//  FristViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/7/28.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class FristViewController: UIViewController {

    
    var data:[String] = ["China","LALA","Ruassian","Amerian","Indian"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for da in data {
            print(da)
        }
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

//
//  FFristViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/7/29.
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

//Tab bar消息页面
class FSecondViewController: UIViewController {

    @IBAction func Click(sender: AnyObject) {
        let vc = UIStoryboard(name: "SecondSon", bundle: nil)
            .instantiateViewControllerWithIdentifier("SecondSonViewController")
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func Download_Image(sender: AnyObject) {
        let vc = UIStoryboard(name: "ImageD", bundle: nil)
            .instantiateViewControllerWithIdentifier("ImageDViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Upload_Image(sender: AnyObject) {
        let vc = UIStoryboard(name: "ImageU", bundle: nil)
            .instantiateViewControllerWithIdentifier("ImageUViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.tabBarController?.tabBar.alpha = 1
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

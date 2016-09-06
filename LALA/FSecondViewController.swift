//
//  FFristViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/7/29.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import CoreData
import SwiftyJSON
import SVProgressHUD

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
    
    @IBAction func UIButton_Zhuan_Click(sender: AnyObject) {

        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Dark)//前后颜色
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.Native)//菊花
        //SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
        
        SVProgressHUD.show()
        //SVProgressHUD.showSuccessWithStatus("lala")
        //SVProgressHUD.showErrorWithStatus("haha")
        
    }
    @IBAction func UIButton_Ting_Click(sender: AnyObject) {
        SVProgressHUD.dismiss()
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
    //文本提示框
    
}

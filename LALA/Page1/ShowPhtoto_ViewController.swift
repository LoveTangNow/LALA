//
//  ShowPhtoto_ViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/11.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import SVProgressHUD

class ShowPhtoto_ViewController: UIViewController {
    
    var imagelist = [Dictionary<String, String>]()
    var images = [UIImage]()
    
    var server = ""
    var serverimage = ""
    var imagenumber_now = 1
    var imagenumber_max = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let diaryList:String = NSBundle.mainBundle().pathForResource("/Server", ofType:"plist")!
        let data:NSMutableDictionary = NSMutableDictionary(contentsOfFile:diaryList)!
        server = data.objectForKey("Server") as! String
        serverimage = server + "photo/TEST_PHOTOS/"
        
        imagelist = NSUserDefaults.standardUserDefaults().valueForKey("imagelist") as! Array
        
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Dark)//前后颜色
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.Native)//菊花
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
        SVProgressHUD.show()
        
        Alamofire.request(.GET, serverimage + imagelist[0]["Photo1"]!)
            .responseImage { response in
                if let image = response.result.value {
                    //cell.UIButton_Main.setBackgroundImage(image, forState: .Normal)
                    print(self.images.count)
                    self.images.append(image)
                    print(self.images.count)
                    self.UIImageView_Main.image = image
                    SVProgressHUD.dismiss()
                }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    @IBOutlet weak var UIButton_Main: UIButton!
    
    
    @IBAction func UISwiperight(sender: UISwipeGestureRecognizer) {
        if self.imagenumber_now > 1 {
            self.imagenumber_now -= 1
            self.UIImageView_Main.image = images[self.imagenumber_now - 1]
        }

    }
        
    @IBAction func UISwipeLeft(sender: UISwipeGestureRecognizer) {
        //判断是不是第一个 是就没动作 不是就变化
        
        //    1             1
        /*
         先看能不能移动
         比较现在的 【图面记号】 和 【最大的图片】 记号
         如果小 就只做图片变化
         如果大 就说明图片还没下载 那就先下载下来 放进数组中 然后图片变化
         */
        if self.imagenumber_now < imagelist.count {
            //imagenumber_now += 1
            //imagenumber_max = imagenumber_now
            //能移动
            if self.imagenumber_now >= self.imagenumber_max {
                //现在的比最大的大 下载+移动
                SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Dark)//前后颜色
                SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.Native)//菊花
                SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
                SVProgressHUD.show()
                Alamofire.request(.GET, serverimage + imagelist[self.imagenumber_now]["Photo" + String(self.imagenumber_now + 1)]!)
                    .responseImage { response in
                        if let image = response.result.value {
                            //cell.UIButton_Main.setBackgroundImage(image, forState: .Normal)
                            self.images.append(image)
                            self.UIImageView_Main.image = image
                            self.imagenumber_now += 1
                            self.imagenumber_max = self.imagenumber_now
                            SVProgressHUD.dismiss()
                        }
                }
            }
            else {
                self.UIImageView_Main.image = images[self.imagenumber_now]
                self.imagenumber_now += 1
            }
        }
        print("left")
    }
    
    @IBOutlet weak var UITextView_Mian: UITextView!

    @IBOutlet weak var UIImageView_Main: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

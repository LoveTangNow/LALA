//
//  ImageUploadViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/12.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SVProgressHUD

class ImageUViewController: UIViewController {
    
    var YaSuoLV:CGFloat = 1
    var server:String = ""
    var serverimage:String = ""
    
    
    
    @IBOutlet weak var UIImageView_For_Upload: UIImageView!
    
    @IBAction func Upload_Click(sender: AnyObject) {
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Dark)//前后颜色
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.Native)//菊花
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
        
        SVProgressHUD.show()

       let imageData = UIImagePNGRepresentation(UIImageView_For_Upload.image!) // 将图片转换成jpeg格式的NSData，压缩到0.3
       let imageStr = imageData?.base64EncodedStringWithOptions(.Encoding64CharacterLineLength) // 将图片转换为base64字符串
//        
//        Alamofire.request(.POST, "http://localhost:80/LALA/GOT_PHOTO_2BYTES.php", parameters: ["file": imageStr!]).validate()
//            .responseData { response in
//                print(response.request)
//                print(response.response)
//                print(response.result)
//        }
        //test_post_get.php
        Alamofire.request(.POST, server + "GOT_PHOTO_2BYTES.php", parameters: ["file": imageStr!])
            .progress { bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
                print(totalBytesWritten)
                //这个进度不好用啊。。
                // This closure is NOT called on the main queue for performance
                // reasons. To update your ui, dispatch to the main queue.
                dispatch_async(dispatch_get_main_queue()) {
                    print("Total bytes written on main queue: \(totalBytesWritten)")
                }
            }
            .validate()
            .responseString { response in
                switch response.result {
                case .Success:
                    print("Success?: \(response.result.isSuccess)")
                    print("Response String: \(response.result.value)")
                    SVProgressHUD.dismiss()
                default:
                    print("Success?: \(response.result.isSuccess)")
                    print("Response String: \(response.result.value)")
                    SVProgressHUD.dismiss()
                }
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let diaryList:String = NSBundle.mainBundle().pathForResource("/Server", ofType:"plist")!
        let data:NSMutableDictionary = NSMutableDictionary(contentsOfFile:diaryList)!
        server = data.objectForKey("Server") as! String
        serverimage = server + "photo/TEST_PHOTOS/"

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

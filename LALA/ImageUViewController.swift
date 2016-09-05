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

class ImageUViewController: UIViewController {
    
    @IBOutlet weak var UIImageView_For_Upload: UIImageView!
    
    @IBAction func Upload_Click(sender: AnyObject) {
        
       let imageData = UIImageJPEGRepresentation(UIImageView_For_Upload.image!, 1) // 将图片转换成jpeg格式的NSData，压缩到0.3
       let imageStr = imageData?.base64EncodedStringWithOptions(.Encoding64CharacterLineLength) // 将图片转换为base64字符串
//        print(imageStr)
//        
//        Alamofire.request(.POST, "http://localhost:80/LALA/GOT_PHOTO_2BYTES.php", parameters: ["file": imageStr!]).validate()
//            .responseData { response in
//                print(response.request)
//                print(response.response)
//                print(response.result)
//        }
        //test_post_get.php
        Alamofire.request(.GET, "http://localhost:80/LALA/GOT_PHOTO_2BYTES.php", parameters: ["file": imageStr!]).validate()
            .responseString { response in
                print("Success: \(response.result.isSuccess)")
                print("Response String: \(response.result.value)")
        }
        
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

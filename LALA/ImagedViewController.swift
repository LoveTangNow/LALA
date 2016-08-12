//
//  ImagedownloadViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/11.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ImageDViewController: UIViewController {

    @IBOutlet weak var TUIImageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("现在是图片下载测试")
        
        self.title = "图片下载测试"
        ///照片测试 start
        
        Alamofire.request(.GET, "http://localhost:80/LALA/aiqinhai04.jpg")
            .responseImage { response in
                
//                debugPrint(response)
//                print(response.request)
//                print(response.response)
//                debugPrint(response.result)
                
                if let image = response.result.value {
                    print("image downloaded: \(image)")
                    self.TUIImageView.image = image
                }
        }
        
        ///照片测试 end

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

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
        
        //let i = UIImageView_For_Upload.image
        let s = UIImageView_For_Upload.image!
        print(s)
        
        let nsd:NSData = UIImageJPEGRepresentation(s, 1.0)!
        
        let fileURL = NSBundle.mainBundle().URLForResource("Simulator", withExtension: "png")
        print(fileURL)

        Alamofire.upload(.POST, "http://localhost:80/LALA/GOT_PHOTO.php", data: nsd)
            .progress { bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
                //print(totalBytesWritten)
                // This closure is NOT called on the main queue for performance
                // reasons. To update your ui, dispatch to the main queue.
                dispatch_async(dispatch_get_main_queue()) {
                    print("Total bytes written on main queue: \(totalBytesWritten)")
                }
            }
            .validate()
            .responseJSON { response in
                print("回收数据1")
                debugPrint(response)
        }
        Alamofire.upload(.POST, "http://localhost:80/LALA/GOT_PHOTO.php", file: fileURL!)
            .validate()
            .responseJSON { response in
                print("回收数据2")
                debugPrint(response)
        }
    }
        

//    static func uploadImage(url:String,parameter:String,imagePath:NSURL ,requestDelegate:RequestDelegate){
//        Alamofire.upload(.POST,URLString: url, multipartFormData: { multipartFormData in multipartFormData.appendBodyPart(fileURL: imagePath, name: "file") },            encodingCompletion: { encodingResult in
//            switch encodingResult {
//            case .Success(let upload, , ): upload.responseJSON {
//                request, response, JSON, error in
//                println(request)
//                println(response)
//                println(error)
//                println(JSON)
//                }
//            case .Failure(let encodingError):
//                println(encodingError)
//            }
//        }
//        )
//        }

        

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

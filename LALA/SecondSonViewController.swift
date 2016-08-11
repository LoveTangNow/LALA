//
//  SecondSonViewController.swift
//  Link_Now
//
//  Created by Thomas Liu on 16/8/8.
//  Copyright © 2016 Thomas Liu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SecondSonViewController: UIViewController {

    @IBOutlet weak var _Lable: UILabel!
    
    //Alamofire + SwiftyJSON
    @IBAction func _Button(sender: AnyObject) {
        
        Alamofire.request(.GET, "http://localhost:80/LALA/SIGNIN.php",parameters: ["data": "bar"])
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        
                        let a = json["data"]["newslist"]["title"].string
                        
                        print(json["data"]["newslist"]["title"])
                        self._Lable.text = a
                        
                    }
                case .Failure(let error):
                    print(error)
                }
        }
        print("1")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.alpha = 0.5

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

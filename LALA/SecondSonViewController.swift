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
        
        Alamofire.request(.GET, "https://localhost/test2/Afiretest.php", parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        print("")
        
        
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

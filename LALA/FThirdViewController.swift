//
//  FThirdViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/7/29.
//  Copyright © 2016 Thomas Liu. All rights reserved.
//

import UIKit
import Alamofire
import CoreData
import Foundation
import SQLite


//Tab bar发现页面
class FThirdViewController: UIViewController {
    
    @IBOutlet weak var pl: UILabel!
    
    var managedObjectContext = true
    
    
    //长按时间
    @IBAction func LLLPP(sender: AnyObject) {
        print("LLLLPPP")
    }
    //获取Plist中的数据
    @IBAction func CoreDaraClick(sender: AnyObject) {
        print("点击了plist")
        //读取数据
        let diaryList:String = NSBundle.mainBundle().pathForResource("Shi_Fou_Deng_Lu", ofType:"plist")!
        let data:NSMutableDictionary = NSMutableDictionary(contentsOfFile:diaryList)!
        let da:NSString = data.objectForKey("username") as! NSString
        print("现在的数据是"+(da as String))
        pl.text = da as String
        
        //写入数据
        //手机上不可实现
        let plistpath:NSString = NSBundle.mainBundle().pathForResource("Shi_Fou_Deng_Lu", ofType:"plist")!
        let usersdic:NSMutableDictionary = NSMutableDictionary(contentsOfFile:plistpath as String)!
        usersdic.setObject("Tang", forKey: "username")
        usersdic.writeToFile(plistpath as String,atomically: true)
        
        print("把Tang写进去了?")
        print("")
        
        
    }

    //CoreData按钮的点击
    @IBAction func CoreData(sender: AnyObject) {

            }
    func sqlitet() -> Int {
        
        do{
            let db = try Connection("/Users/ThomasLiu/Documents/workspace/Xcodeworkspace/Aplications/LALA/LALA/sqlite1.sqlite")
            
            let users = Table("users")
            let id = Expression<Int64>("id")
            let name = Expression<String?>("name")
            let email = Expression<String>("email")
            
            try db.run(users.create { t in
                t.column(id, primaryKey: true)
                t.column(name)
                t.column(email, unique: true)
                })
            
            
            let insert = users.insert(name <- "Alice", email <- "alice@mac.com")
            let rowid = try db.run(insert)
            // INSERT INTO "users" ("name", "email") VALUES ('Alice', 'alice@mac.com')
            
            for user in try db.prepare(users) {
                print("id: \(user[id]), name: \(user[name]), email: \(user[email])")
                // id: 1, name: Optional("Alice"), email: alice@mac.com
            }
            // SELECT * FROM "users"
            
            let alice = users.filter(id == rowid)
            
            try db.run(alice.update(email <- email.replace("mac.com", with: "me.com")))
            // UPDATE "users" SET "email" = replace("email", 'mac.com', 'me.com')
            // WHERE ("id" = 1)
            
            try db.run(alice.delete())
            // DELETE FROM "users" WHERE ("id" = 1)
            
            db.scalar(users.count) // 0
            // SELECT count(*) FROM "users"
        }
        catch
        {
            print(error)
        }
        
        return 1
    }
    
    ///////////////////////一下不重要、、/////////////////
    
    
    func ZhuCecClick(sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewControllerWithIdentifier("ZhuCeViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

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

class FThirdViewController: UIViewController {
    
    @IBOutlet weak var pl: UILabel!
    
    var managedObjectContext = true
    
    //获取Plist中的数据
    @IBAction func CoreDaraClick(sender: AnyObject) {
        print("点击了CoreData")
        
        let diaryList:String = NSBundle.mainBundle().pathForResource("Shi_Fou_Deng_Lu", ofType:"plist")!
        let data:NSMutableDictionary = NSMutableDictionary(contentsOfFile:diaryList)!
       // let diaries:DarwinBoolean = data.objectForKey("islog") as! DarwinBoolean
        let da:NSString = data.objectForKey("username") as! NSString
        print(da)
        
        let plistpath:NSString = NSBundle.mainBundle().pathForResource("Shi_Fou_Deng_Lu", ofType:"plist")!
        let usersdic:NSMutableDictionary = NSMutableDictionary(contentsOfFile:plistpath as String)!
        
        usersdic.setObject("Tang", forKey: "username")
        usersdic.writeToFile(plistpath as String,atomically: true)
        
        print("Tangin")
        
        
    }

    //更新Lable文字
    @IBAction func PLC(sender: AnyObject) {
        
    }

    @IBAction func DengluClick(sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewControllerWithIdentifier("DengLuViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ZhuCecClick(sender: AnyObject) {
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
    
//    func saveCoreDate(){
//        //加载AppDelegate
//        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
//        //获取管理的上下文
//        let context = appDel.managedObjectContext
//        //创建一个实例并给属性赋值
//        let Entity = NSEntityDescription.insertNewObjectForEntityForName("Entity", inManagedObjectContext: context)as! Entity
//        Entity.id = 2
//        Entity.name = "小红"
//        Entity.age = 12
//        //下面这种赋值方式也可以的
//        //        let entity = NSEntityDescription.entityForName("People", inManagedObjectContext: context)
//        //        let people = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
//        //        people.setValue(1, forKey: "id")
//        //        people.setValue("小明", forKey: "name")
//        //        people.setValue(10, forKey: "age")
//        //保存数据
//        do {
//            try context.save()
//            print("保存成功")
//        }catch let error{
//            print("context can't save!, Error:\(error)")
//        }
//    }
    
    
//    func fetchCoreData (){
//        //加载AppDelegate
//        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
//        //获取管理的上下文
//        let context = appDel.managedObjectContext
//        // 声明数据请求实体
//        let fetchRequest = NSFetchRequest(entityName: "People")
//        
//        //        let predicate = NSPredicate(format:"id=1")  //设置查询条件按照id查找不设置查询条件，则默认全部查找
//        //        fetchRequest.predicate=predicate
//        //执行查询操作
//        do {
//            let peopleList =
//                try context.executeFetchRequest(fetchRequest)as! [NSManagedObject]
//            print("打印查询结果")
//            for person in peopleListas ! [Entity] {
//                print("查询到的人是\(person.name!)")
//                //修改操作:将查询到的结果修改后，再调用context.save()保存即可
//                if (person.name == "小红"){
//                    person.name="小花"
//                }
//                //删除操作:将查询到的额结果删除后，再调用context.save()保存即可
//                if (person.name == "小明"){
//                    context.deleteObject(person)
//                }
//            }
//        }catch let error{
//            print("context can't fetch!, Error:\(error)")
//        }
//        do {
//            try context.save()
//            print("保存成功")
//        }catch let error{
//            print("context can't save!, Error:\(error)")
//        }
//        
//    }
//    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

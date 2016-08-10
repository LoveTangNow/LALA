//
//  FFristViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/10.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class FFristViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var MainTableView: UITableView!

    var datamain = [
    
        ttimecell(
            image_left_top: "user-female-vector", image_right_top: "user-female-vector",
            image_mid_left: "user-female-vector", image_mid_mid: "user-female-vector",   image_mid_right: "user-female-vector",
            image_left_bottom: "user-female-vector",  image_right_bottom: "user-female-vector",
            /////////
            lable_sender: "用户1"   ,
            lable_time: "1234",
            lable_pinglun_number:"123",  lable_zan_number:"123"
        ),
        
        ttimecell(
        image_left_top: "user-female-vector", image_right_top: "user-female-vector",
        image_mid_left: "user-female-vector", image_mid_mid: "user-female-vector",   image_mid_right: "user-female-vector",
        image_left_bottom: "user-female-vector",  image_right_bottom: "user-female-vector",
        /////////
        lable_sender: "用户2"   ,
        lable_time: "123456",
        lable_pinglun_number:"123",  lable_zan_number:"234"
        ),
        
        ttimecell(
            image_left_top: "user-female-vector", image_right_top: "user-female-vector",
            image_mid_left: "user-female-vector", image_mid_mid: "user-female-vector",   image_mid_right: "user-female-vector",
            image_left_bottom: "user-female-vector",  image_right_bottom: "user-female-vector",
            /////////
            lable_sender: "用户3"   ,
            lable_time: "123456789",
            lable_pinglun_number:"123",  lable_zan_number:"345"
        )
    
    //video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
    
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
    
        MainTableView.dataSource = self
        MainTableView.delegate = self
    
    }
//////////////////tableView_start


func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
{
    return 205
}

func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
}

func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return datamain.count
}

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = MainTableView.dequeueReusableCellWithIdentifier("FFristTableViewCell", forIndexPath: indexPath) as! FFristTableViewCell
    let video0 = datamain[indexPath.row]
    
    cell.image_left_top.image = UIImage(named:video0.image_left_top )
    cell.image_right_top.image = UIImage(named:video0.image_right_top )
    cell.image_mid_left.image = UIImage(named:video0.image_mid_left )
    cell.image_mid_mid.image = UIImage(named:video0.image_mid_mid )
    cell.image_mid_right.image = UIImage(named:video0.image_mid_right )
    cell.image_left_bottom.image = UIImage(named:video0.image_left_top )
    cell.image_right_bottom.image = UIImage(named:video0.image_right_bottom )
    /////////
    cell.lable_sender.text = video0.lable_sender
    cell.lable_time.text = video0.lable_time
    cell.lable_zan_number.text = video0.lable_zan_number
    cell.lable_pinglun_number.text = video0.lable_pinglun_number
    
    return cell
    
}

/////////////tableView_end




override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

}

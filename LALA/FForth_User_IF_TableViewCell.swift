//
//  FForth_User_IF_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/27.
//  Copyright © 2016 Thomas Liu. All rights reserved.
//

import UIKit

class FForth_User_IF_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var User_Icon: UIImageView!
    @IBOutlet weak var User_VIP: UIImageView!
    
    @IBOutlet weak var USER_NAME: UILabel!
    @IBOutlet weak var USER_JIAN_JIE: UILabel!
    
    @IBOutlet weak var NEWS_NUMBERS: UILabel!
    @IBOutlet weak var NEWS_WORD: UILabel!
    
    @IBOutlet weak var Fouse_Number: UILabel!
    @IBOutlet weak var Focus_Word: UILabel!
    
    @IBOutlet weak var Fans_Number: UILabel!
    @IBOutlet weak var Fans_Word: UILabel!
    
    @IBOutlet weak var Image_Space: UIImageView!

    //整个 tableview cell 的造型初始化可以在这里！！！！
    override func awakeFromNib() {
        
//        let imageView=UIImageView(image:UIImage(named:"Black"))
//        imageView.frame=CGRectMake(10,10,100,100)
//        self.addSubview(imageView)
        
        User_Icon.layer.cornerRadius = User_Icon.frame.width/4
        User_Icon.clipsToBounds = true
        
        print("awakeFromNib")
        
        User_VIP.animationImages=[UIImage(named:"Black")!,UIImage(named:"White")!]
        User_VIP.animationDuration=5
        
        super.awakeFromNib()
        // Initialization code
        //User_Icon.frame = CGRectMake(50, 50, 50, 90)
        //self.reloadInputViews()
    }

    //可以算是 tableview cell 的点击事件。。
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        print("setSelected")

        // Configure the view for the selected state
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        User_VIP.startAnimating()
    }
    
    override func willRemoveSubview(subview: UIView) {
        User_VIP.stopAnimating()
    }

}

//
//  PinglunZanO_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/7.
//  Copyright © 2016 Thomas Liu. All rights reserved.
//

import UIKit

class PinglunZanO_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var UIButton1: UIButton!
    @IBOutlet weak var UIButton2: UIButton!
    @IBOutlet weak var UIButton3: UIButton!
    
    var Pinglun_NUM = 0
    var Zan_NUM = 0
    var Cai_NUM = 0
    
    var Pinglun_BOOL = false
    var Zan_BOOL = false
    var Cai_BOOL = false
    
    var Sender_ID:String = ""
    
    
    //点赞取消赞还需要同步到服务器上啊~！！
    
    @IBAction func UIButton1_Click(sender: AnyObject) {
        //评论 需要转页面
        if Pinglun_BOOL == false {
            Pinglun_NUM += 1
            Pinglun_BOOL = true
        } else {
            Pinglun_NUM -= 1
            Pinglun_BOOL = false
        }
        
        UIButton1.setTitle("评论" + String(Pinglun_NUM), forState:.Normal)
    }
    
    @IBAction func UIButton2_Click(sender: AnyObject) {
        //赞
        if Zan_BOOL == false {
            Zan_NUM += 1
            Zan_BOOL = true
        } else {
            Zan_NUM -= 1
            Zan_BOOL = false
        }

        UIButton2.setTitle("赞" + String(Zan_NUM), forState:.Normal)
    }
    
    @IBAction func UIButton3_Click(sender: AnyObject) {
        //踩
        if Cai_BOOL == false {
            Cai_NUM += 1
            Cai_BOOL = true
        } else {
            Cai_NUM -= 1
            Cai_BOOL = false
        }

        UIButton3.setTitle("踩" + String(Cai_NUM), forState:.Normal)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  SN_SHARE_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/6.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class SN_SHARE_TableViewCell: UITableViewCell,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var UIImageView1: UIImageView!
    
    
    
    @IBAction func Button_Click(sender: AnyObject) {
      
        print("aaaaaa")
        
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

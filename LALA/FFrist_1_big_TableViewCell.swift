//
//  FFrist_1_big_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/8/11.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//
import UIKit

class FFrist_1_big_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var UIImageView_Top_Left: UIImageView!
    @IBOutlet weak var UIImageView_Top_Right: UIImageView!
    @IBOutlet weak var UIImageView_Mian: UIImageView!
    
    @IBOutlet weak var UILabel_sender: UILabel!
    @IBOutlet weak var UILabel_Information: UILabel!
    @IBOutlet weak var UILabel_detail: UILabel!
    
    @IBOutlet weak var UILabel_Pinglun: UILabel!
    @IBOutlet weak var UILabel_Zan: UILabel!
    @IBOutlet weak var UILabel_Cai: UILabel!
    
    @IBOutlet weak var UIImageView_BackGround:UIImageView!
    
    @IBOutlet weak var ConteViewssssss: UIView!

    let Guding_Height = 80
    
    override func awakeFromNib() {
        
        UIImageView_Top_Left.layer.cornerRadius = UIImageView_Top_Left.frame.width / 2
        UIImageView_Top_Left.clipsToBounds = true
        
        UIImageView_Top_Right.layer.cornerRadius = UIImageView_Top_Right.frame.width / 6
        UIImageView_Top_Right.clipsToBounds = true
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

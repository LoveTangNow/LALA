//
//  SN_WORDS_TableViewCell.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/6.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class SN_WORDS_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var UITextView_Main: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text.containsString("\n") {
            self.UITextView_Main.endEditing(true)
            return false
        }
        return true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if selected {
            //选中。
            print("textview line seleccted")
        } else {
            //不再选中。
            print("textview line no seleccted")
        }
    }

}

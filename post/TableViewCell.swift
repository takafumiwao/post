//
//  TableViewCell.swift
//  post
//
//  Created by mgt on 2019/01/21.
//  Copyright © 2019 mgt. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(text: String) {
        label1.text = text
    }
    
}

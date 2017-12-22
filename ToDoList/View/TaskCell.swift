//
//  TaskCell.swift
//  ToDoList
//
//  Created by Chisoo Kim on 12/22/17.
//  Copyright © 2017 Chisoo Kim. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

//
//  MenuCell.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    let labels = ["Участники", "Лабы", "Проекты", "События", "Чат", "Гранты"]
    
    
    @IBOutlet weak var menuLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = color4
        menuLabel.textColor = color2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setName(row: Int) {
        menuLabel.text = labels[row]
    }
    
}

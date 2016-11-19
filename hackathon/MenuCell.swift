//
//  MenuCell.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    let labels = ["Участники", "Лабы", "Проекты", "Чат", "Гранты"]
    
    
    @IBOutlet weak var menuLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setName(row: Int) {
        menuLabel.text = labels[row]
    }
    
}

//
//  LabsCell.swift
//  hackathon
//
//  Created by sisupov on 20.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit

class LabsCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = color6
        nameLabel.textColor = color2
        descLabel.textColor = color2
        skillsLabel.textColor = color2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

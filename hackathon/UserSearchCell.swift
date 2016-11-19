//
//  UserSearchCell.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit

class UserSearchCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var labelsContainer: UIView!
    @IBOutlet weak var interestsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = 36
        profileImage.layer.masksToBounds = true
        contentView.backgroundColor = color6
        labelsContainer.backgroundColor = color6
        nameLabel.textColor = color2
        interestsLabel.textColor = color2
        commentLabel.textColor = color2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

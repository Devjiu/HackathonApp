//
//  ProfileCell.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.image = Profile.user.photo ?? UIImage(named: "profileEmpty")!
        profileName.text = Profile.user.name
        profileName.textColor = color2
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 25.5
        contentView.backgroundColor = color4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

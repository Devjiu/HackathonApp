//
//  ProfileInterestCell.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit

protocol ProfileInterestCellDelegate {
    func updateHeight(index: Int, value: CGFloat)
}

class ProfileInterestCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var color: UIColor = UIColor.darkGray {
        didSet {
            fillStackView(labels: labels)
        }
    }
    var height: CGFloat = 30
    var indexPath: Int!
    var delegate: ProfileInterestCellDelegate?
    var labels = [String]()

    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.spacing = 5
        stackView.alignment = UIStackViewAlignment.leading
        contentView.backgroundColor = color6
        nameLabel.textColor = color4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillStackView(labels: [String]) {
        self.labels = labels
        for v in stackView.subviews {
            stackView.removeArrangedSubview(v)
            v.removeFromSuperview()
        }
        var i = 0
        height = 30
        for labelText in labels {
            let tempLabel = UILabel()
            tempLabel.text = labelText
            let width = tempLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: 50, height: 20), limitedToNumberOfLines: 1).width * 1.1
            let labelView = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            labelView.backgroundColor = color
            labelView.textColor = color4
            labelView.text = labelText
            labelView.textAlignment = NSTextAlignment.center
            labelView.layer.cornerRadius = 5
            labelView.layer.masksToBounds = true
            stackView.insertArrangedSubview(labelView, at: i)
            i += 1
            height += 25
        }
    }
    
    func fillCell(row: Int) {
        switch row {
        case 0:
            fillStackView(labels: Profile.user.interests)
            break
        case 1:
            fillStackView(labels: Profile.user.skills)
            break
        case 2:
            fillStackView(labels: Profile.user.achievements)
            break
        default:
            break
            
        }
    }
    
}

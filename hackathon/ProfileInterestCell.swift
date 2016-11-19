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
    
    var color: UIColor = UIColor.darkGray
    var height: CGFloat = 30
    var indexPath: Int!
    var delegate: ProfileInterestCellDelegate?
    var labels = [String]()

    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.spacing = 5
        stackView.alignment = UIStackViewAlignment.leading
        fillStackView(labels: ["111", "222"])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillStackView(labels: [String]) {
        self.labels = labels
        for v in stackView.subviews {
            stackView.removeArrangedSubview(v)
        }
        var i = 0
        height = 30
        for labelText in labels {
            let tempLabel = UILabel()
            tempLabel.text = labelText
            let width = tempLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: 30, height: 15), limitedToNumberOfLines: 1).width * 1.1
            let labelView = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 15))
            labelView.backgroundColor = color
            labelView.text = labelText
            labelView.textAlignment = NSTextAlignment.center
            labelView.layer.cornerRadius = 5
            labelView.layer.masksToBounds = true
            stackView.insertArrangedSubview(labelView, at: i)
            i += 1
            height += 20
        }
        
        delegate?.updateHeight(index: indexPath, value: height)
    }
    
}

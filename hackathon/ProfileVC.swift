//
//  MainViewController.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit
import ECSlidingViewController

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileInterestCellDelegate {

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var cellHeights = [50.0, 50.0, 50.0]
    var cellNames = ["Интересы:", "Навыки:", "Достижения:"]
    var cellColors = [color1, color3, color2]
    
    @IBAction func buttonPressed() {
        if(self.slidingViewController().currentTopViewPosition == ECSlidingViewControllerTopViewPosition.centered){
            self.slidingViewController().anchorTopViewToRight(animated: true)
        } else {
            self.slidingViewController().resetTopView(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileImage()
        setupEditButton()
        setupTableView()
        setupUserData()
        view.backgroundColor = color4
        tableView.backgroundColor = color6
        editButton.backgroundColor = color5
        nameLabel.textColor = color2
        commentLabel.textColor = color2
        statusLabel.textColor = color2
        editButton.setTitleColor(color2, for: UIControlState.normal)
    }
    
    
    @IBAction func editButtonPressed() {
    }
    
    func updateHeight(index: Int, value: CGFloat) {
        cellHeights[index] = Double(value)
        tableView.reloadData()
    }
    
    
    // USER INTERFACE
    
    func setupProfileImage() {
        profileImage.layer.cornerRadius = 12
        profileImage.layer.masksToBounds = true
    }
    
    func setupEditButton() {
        editButton.layer.cornerRadius = 10
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.register(UINib(nibName: "ProfileInterestCell", bundle: nil), forCellReuseIdentifier: "ProfileInterestCellId")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHeights[indexPath.row])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileInterestCellId", for: indexPath) as! ProfileInterestCell
        cell.indexPath = indexPath.row
        cell.delegate = self
        cell.nameLabel.text = cellNames[indexPath.row]
        if cell.color != cellColors[indexPath.row] {
            cell.color = cellColors[indexPath.row]
        }
        cell.fillCell(row: indexPath.row)
        if cellHeights[indexPath.row] != Double(cell.height) {
            if cell.labels.count == 0 {
                return cell
            }
            cellHeights[indexPath.row] = Double(cell.height)
            tableView.reloadData()
        }
        return cell
    }
    
    func setupUserData() {
        profileImage.image = Profile.user.photo ?? UIImage(named: "profileEmpty")!
        nameLabel.text = Profile.user.name
        statusLabel.text = Profile.user.status
        commentLabel.text = Profile.user.comment
    }

}

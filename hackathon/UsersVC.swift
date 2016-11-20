//
//  UsersVC.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit
import ECSlidingViewController

class UsersVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var usersCount: Int = 5
    var users = [Profile(), Profile(), Profile(), Profile(), Profile()]
    
    @IBAction func buttonPressed() {
        if(self.slidingViewController().currentTopViewPosition == ECSlidingViewControllerTopViewPosition.centered){
            self.slidingViewController().anchorTopViewToRight(animated: true)
        } else {
            self.slidingViewController().resetTopView(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        view.backgroundColor = color4
        searchBar.barTintColor = color4
        tableView.backgroundColor = color6
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUsers {
            profiles, error in
            if error == nil && profiles != nil {
                self.reloadDataWithUsers(users: profiles!)
            }
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UserSearchCell", bundle: nil), forCellReuseIdentifier: "SearchUserCellId")
        tableView.tableFooterView = UIView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchUserCellId", for: indexPath) as! UserSearchCell
        if indexPath.row < usersCount {
            cell.profileImage.image = users[indexPath.row].photo ?? UIImage(named: "profileEmpty")!
            cell.nameLabel.text = users[indexPath.row].name
            var interests = "Интересы: "
            var i = 0
            for interest in users[indexPath.row].interests {
                interests.append(interest)
                if i != users[indexPath.row].interests.count - 1 {
                    interests.append(", ")
                }
                i += 1
            }
            cell.interestsLabel.text = interests
            cell.commentLabel.text = users[indexPath.row].comment ?? ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        openUserProfile(profile: users[indexPath.row])
    }
    
    func reloadDataWithUsers(users: [Profile]) {
        self.users = users
        self.usersCount = users.count
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func openUserProfile(profile: Profile) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "profileVC")
        (vc as! ProfileVC).mode = .Other
        (vc as! ProfileVC).user = profile
        vc!.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(vc!, animated: true) {
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.characters.count == 0 {
            getUsers {
                profiles, error in
                if error == nil && profiles != nil {
                    self.reloadDataWithUsers(users: profiles!)
                }
            }
        } else if searchText.characters.count >= 3 {
            searchUsers(text: searchText) {
                profiles, error in
                if error == nil && profiles != nil {
                    self.reloadDataWithUsers(users: profiles!)
                }
            }
        }
    }
}

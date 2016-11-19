//
//  MenuVC.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        self.tableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCellIdentifier")
        self.tableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCellIdentifier")
        tableView.backgroundColor = color4
        view.backgroundColor = color4
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellIdentifier", for: indexPath) as! ProfileCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCellIdentifier", for: indexPath) as! MenuCell
            cell.setName(row: indexPath.row - 1)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        performMenuAction(row: indexPath.row)
    }
    
    func performMenuAction(row: Int) {
        if row == 0 {
            self.slidingViewController().topViewControllerStoryboardId = "profileVC"
            self.slidingViewController().topViewController = self.storyboard?.instantiateViewController(withIdentifier: "profileVC")
        } else if row == 1 {
            self.slidingViewController().topViewControllerStoryboardId = "usersVC"
            self.slidingViewController().topViewController = self.storyboard?.instantiateViewController(withIdentifier: "usersVC")
        } else if row == 2 {
            self.slidingViewController().topViewControllerStoryboardId = "labsVC"
            self.slidingViewController().topViewController = self.storyboard?.instantiateViewController(withIdentifier: "labsVC")
        } else if row == 3 {
            self.slidingViewController().topViewControllerStoryboardId = "usersVC"
            self.slidingViewController().topViewController = self.storyboard?.instantiateViewController(withIdentifier: "usersVC")
        } else {
            self.slidingViewController().topViewControllerStoryboardId = "topVC"
            self.slidingViewController().topViewController = self.storyboard?.instantiateViewController(withIdentifier: "topVC")
        }
        self.slidingViewController().resetTopView(animated: true)
    }
    
    
    

}

//
//  LabsVC.swift
//  hackathon
//
//  Created by sisupov on 20.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit
import ECSlidingViewController

enum EventsMode {
    case Labs
    case Projects
    case Events
}

class LabsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var mode = EventsMode.Labs
    
    var labsCount: Int = 5
    var labs = [Lab(), Lab(), Lab(), Lab(), Lab()]
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getLabs {
            labs, error in
            if error == nil && labs != nil {
                self.reloadDataWithLabs(labs: labs!)
            }
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LabsCell", bundle: nil), forCellReuseIdentifier: "LabsCellId")
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labsCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabsCellId", for: indexPath) as! LabsCell
        if indexPath.row < labsCount {
            cell.nameLabel.text = labs[indexPath.row].name
            cell.descLabel.text = "Описание:\n".appending(labs[indexPath.row].description)
            var skillsText = "Технологии:\n"
            var i = 0
            for skill in labs[indexPath.row].skills {
                skillsText = skillsText.appending(skill)
                if i != labs[indexPath.row].skills.count - 1 {
                    skillsText = skillsText.appending(", ")
                }
                i += 1
            }
            cell.skillsLabel.text = skillsText
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        openLab(lab: labs[indexPath.row])
    }
    
    func reloadDataWithLabs(labs: [Lab]) {
        self.labs = labs
        self.labsCount = labs.count
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func openLab(lab: Lab) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "labVC") as! SingleLabVC
        vc.lab = lab
        self.present(vc, animated: true) {
        }
    }


}

//
//  SingleLabVC.swift
//  hackathon
//
//  Created by sisupov on 20.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import UIKit

class SingleLabVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var skillsConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var skillsView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var lab = Lab()
    
    var usersCount = 5
    var users = [Profile(), Profile(), Profile(), Profile(), Profile()]
    
    @IBAction func buttonPressed() {
        self.dismiss(animated: true) {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = lab.name
        descriptionLabel.text = lab.description
        setSkills(skills: lab.skills)
        setupUI()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUsers()
    }

    @IBAction func acceptButtonPressed() {
    }
    
    func setupUI() {
        view.backgroundColor = color4
        skillsView.backgroundColor = color4
        tableView.backgroundColor = color6
        nameLabel.textColor = color2
        descriptionLabel.textColor = color2
        stackView.spacing = 5
        stackView.alignment = UIStackViewAlignment.leading
        skillsLabel.textColor = color2
        acceptButton.setTitle("Принять участие", for: UIControlState.normal)
        acceptButton.setTitleColor(color2, for: UIControlState.normal)
        acceptButton.backgroundColor = color5
        acceptButton.layer.cornerRadius = 10
        
    }

    func setSkills(skills: [String]) {
        lab.skills = skills
        for v in stackView.subviews {
            stackView.removeArrangedSubview(v)
            v.removeFromSuperview()
        }
        var i = 0
        skillsConstraint.constant = 10
        for labelText in skills {
            let tempLabel = UILabel()
            tempLabel.text = labelText
            let width = tempLabel.textRect(forBounds: CGRect(x: 0, y: 0, width: 50, height: 20), limitedToNumberOfLines: 1).width * 1.1
            let labelView = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            labelView.backgroundColor = color1
            labelView.textColor = color4
            labelView.text = labelText
            labelView.textAlignment = NSTextAlignment.center
            labelView.layer.cornerRadius = 5
            labelView.layer.masksToBounds = true
            stackView.insertArrangedSubview(labelView, at: i)
            i += 1
            skillsConstraint.constant += 25
        }
        if skillsConstraint.constant < 35 {
            skillsConstraint.constant = 35
        }
    }
    
    func reloadUsers(profiles: [Profile]) {
        self.users = profiles
        self.usersCount = profiles.count
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
    
    func openUserProfile(profile: Profile) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "profileVC")
        (vc as! ProfileVC).mode = .Other
        (vc as! ProfileVC).user = profile
        vc!.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(vc!, animated: true) {
        }
    }
    
    func getUsers() {
        switch lab.mode {
        case .Labs:
            getLabUsers(labId: lab.id) {
                profiles, error in
                if error == nil && profiles != nil {
                    self.reloadUsers(profiles: profiles!)
                }
            }
            break
        case .Projects:
            getProjectUsers(labId: lab.id) {
                profiles, error in
                if error == nil && profiles != nil {
                    self.reloadUsers(profiles: profiles!)
                }
            }
            break
        case .Events:
            getEventUsers(labId: lab.id) {
                profiles, error in
                if error == nil && profiles != nil {
                    self.reloadUsers(profiles: profiles!)
                }
            }
            break
        }
    }


}

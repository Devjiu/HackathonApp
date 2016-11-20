//
//  ProfileManager.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import Foundation
import UIKit

class Profile {
    var id: Int
    var photo: UIImage?
    var name: String
    var status: String
    var comment: String?
    var interests: [String]
    var skills: [String]
    var achievements: [String]
    
    init(name: String, status: String, comment: String?, interests: [String], skills: [String], achievements: [String], photo: UIImage?, id: Int) {
        self.name = name
        self.status = status
        self.comment = comment
        self.interests = interests
        self.skills = skills
        self.achievements = achievements
        self.photo = photo
        self.id = id
    }
    
    init() {
        self.name = "Magister Yoda"
        self.status = "Jedi"
        self.comment = "May the force be with you"
        self.interests = ["Lightsabers"]
        self.skills = ["Everything"]
        self.achievements = ["Force knowledge"]
        self.photo = UIImage(named: "yoda")
        self.id = 0
    }
    
    static var user: Profile {
        if LoginManager().isIsupovLogin {
            return Profile(name: "Sergey Isupov", status: "5 курс", comment: "Comment", interests: ["iOS", "Math", "C++"], skills: ["iOS", "C++", "Something"], achievements: ["None"], photo: nil, id: 777)
        } else {
            return Profile(name: "Petr Kurapov", status: "Student", comment: "Hello world!", interests: ["yoga", "snowboarding", "programming"], skills: ["Java", "Django", "Python", "C++"], achievements: [], photo: nil, id: 17)
        }
    }
}

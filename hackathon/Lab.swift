//
//  Lab.swift
//  hackathon
//
//  Created by sisupov on 20.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import Foundation

class Lab {
    var name: String
    var description: String
    var skills: [String]
    var id: Int
    var time: String?
    var mode = EventsMode.Labs
    
    init() {
        name = "Lab Example"
        description = "Description will be here"
        skills = ["iOS", "xcode", "Swift3"]
        id = 0
    }
    
    init(name: String, desc: String, skills: [String], id: Int) {
        self.name = name
        self.description = desc
        self.skills = skills
        self.id = id
    }
}

//
//  HTTPSupport.swift
//  hackathon
//
//  Created by sisupov on 20.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import Foundation
import SwiftyJSON

func usersFromData(data: Data) -> [Profile] {
    let json = JSON(data: data)
    let countUsers = json.count
    var profiles = [Profile]()
    for i in 0..<countUsers {
        var name: String = json[i]["first_name"].rawString()!
        name = name.appending(" ").appending(json[i]["last_name"].rawString()!)
        let person = Profile()
        person.name = name
        person.status = json[i]["status"].rawString()!
        person.comment = json[i]["comment"].rawString()!
        person.skills = []
        if let id = json[i]["member_id"].rawValue as? Int {
            person.id = id
        }
        let skills = json[i]["skills"]
        for j in 0..<skills.count {
            let text = "skill".appending(String(j + 1))
            let skill = skills[text].rawString()!
            person.skills.append(skill)
        }
        person.interests = []
        let interests = json[i]["interests"]
        for j in 0..<interests.count {
            let text = "interest".appending(String(j + 1))
            let interest = interests[text].rawString()!
            person.interests.append(interest)
        }
        person.achievements = []
        let achievements = json[i]["achievements"]
        for j in 0..<achievements.count {
            let text = "achievement".appending(String(j + 1))
            let achievement = achievements[text].rawString()!
            person.achievements.append(achievement)
        }
        
        profiles.append(person)
    }
    return profiles
}

func labsFromData(data: Data) -> [Lab] {
    let json = JSON(data: data)
    let countLabs = json.count
    var labs = [Lab]()
    for i in 0..<countLabs {
        let name: String = json[i]["name"].rawString()!
        let lab = Lab()
        lab.name = name
        let descr = json[i]["description"].rawString()!
        lab.description = descr
        let id = json[i]["project_id"].rawValue
        lab.id = id as! Int
        lab.time = json[i]["time"].rawString()
        lab.skills = []
        let skills = json[i]["skills"]
        for j in 0..<skills.count {
            let text = "skill".appending(String(j + 1))
            let skill = skills[text].rawString()!
            lab.skills.append(skill)
        }
        labs.append(lab)
    }
    return labs
}

func dataTaskLabs(url: URL, completion: @escaping (AnyObject?, Int?) -> Void) {
    let request = NSMutableURLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) {
        data, response, error in
        
        if error != nil
        {
            print("error=\(error)")
            completion(nil, 1)
        }
        if let data = data {
            let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            let labs = labsFromData(data: data)
            completion(labs as AnyObject, nil)
            
        } else {
            completion(nil, 3)
        }
        
    }
    
    task.resume()
}

func dataTaskUsers(url: URL, completion: @escaping (AnyObject?, Int?) -> Void) {
    let request = NSMutableURLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) {
        data, response, error in
        
        if error != nil
        {
            print("error=\(error)")
            completion(nil, 1)
        }
        if let data = data {
            let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            let users = usersFromData(data: data)
            completion(users as AnyObject, nil)
            
        } else {
            completion(nil, 3)
        }
        
    }
    
    task.resume()
}

func getRequest(url: URL, completion: @escaping (Int?) -> Void) {
    let request = NSMutableURLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) {
        data, response, error in
        
        if error != nil
        {
            print("error=\(error)")
            completion(1)
        }
        if let data = data {
            let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            completion(nil)
        } else {
            completion(3)
        }
        
    }
    
    task.resume()
}

//
//  HTTPRequests.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import Foundation
import SwiftyJSON


func getUsers(completion: @escaping (_ profiles: [Profile]?, _ error: Int?) -> Void) {
    let scriptUrl = "http://127.0.0.1:8000/server/getusers/"
    let myUrl = URL(string: scriptUrl)
    let request = NSMutableURLRequest(url:myUrl!)
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
            
            let json = JSON(data: data)
            let countUsers = json.count
            var profiles = [Profile]()
            for i in 0..<countUsers {
                var name: String = json[i]["first_name"].rawString()!
                name = name.appending(" ").appending(json[i]["last_name"].rawString()!)
                let person = Profile()
                person.name = name
                profiles.append(person)
            }
            completion(profiles, nil)
            
            } else {
            completion(nil, 3)
        }
        
    }
    
    task.resume()
}

func getLabs(completion: @escaping (_ profiles: [Lab]?, _ error: Int?) -> Void) {
    completion([Lab(), Lab()], nil)
    return
    let scriptUrl = "http://127.0.0.1:8000/server/getlabs/"
    let myUrl = URL(string: scriptUrl)
    let request = NSMutableURLRequest(url:myUrl!)
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
            
            let json = JSON(data: data)
            let countLabs = json.count
            var labs = [Lab]()
            for i in 0..<countLabs {
//                var name: String = json[i]["first_name"].rawString()!
//                name = name.appending(" ").appending(json[i]["last_name"].rawString()!)
//                let person = Profile()
//                person.name = name
//                profiles.append(person)
            }
            completion(labs, nil)
            
        } else {
            completion(nil, 3)
        }
        
    }
    
    task.resume()
}

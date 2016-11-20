//
//  HTTPRequests.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import Foundation
import SwiftyJSON

let SERVER_URL = "http://127.0.0.1:8000/server/"

func getUsers(completion: @escaping (_ profiles: [Profile]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "getusers/"
    let myUrl = URL(string: scriptUrl)
    dataTaskUsers(url: myUrl!) {
        response, error in
        completion(response as? [Profile], error)
    }
}

func getLabs(completion: @escaping (_ profiles: [Lab]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "getlabs/"
    let myUrl = URL(string: scriptUrl)
    dataTaskLabs(url: myUrl!) {
        response, error in
        completion(response as? [Lab], error)
    }
}

func getLabUsers(labId: Int, completion: @escaping (_ profiles: [Profile]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "getlabusers/"
    let urlWithParams = scriptUrl + "?id=\(labId)"
    let myUrl = URL(string: urlWithParams)
    dataTaskUsers(url: myUrl!) {
        response, error in
        completion(response as? [Profile], error)
    }
}

func searchUser(string: String, completion: @escaping (_ profiles: [Profile]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "searchusers/"
    let urlWithParams = scriptUrl + "?string=\(string)"
    let myUrl = URL(string: urlWithParams)
    dataTaskUsers(url: myUrl!) {
        response, error in
        completion(response as? [Profile], error)
    }
}

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

func getProjects(completion: @escaping (_ profiles: [Lab]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "getprojects/"
    let myUrl = URL(string: scriptUrl)
    dataTaskLabs(url: myUrl!) {
        response, error in
        completion(response as? [Lab], error)
    }
}

func getEvents(completion: @escaping (_ profiles: [Lab]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "getevents/"
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

func getProjectUsers(labId: Int, completion: @escaping (_ profiles: [Profile]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "getprojectusers/"
    let urlWithParams = scriptUrl + "?id=\(labId)"
    let myUrl = URL(string: urlWithParams)
    dataTaskUsers(url: myUrl!) {
        response, error in
        completion(response as? [Profile], error)
    }
}

func getEventUsers(labId: Int, completion: @escaping (_ profiles: [Profile]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "geteventusers/"
    let urlWithParams = scriptUrl + "?id=\(labId)"
    let myUrl = URL(string: urlWithParams)
    dataTaskUsers(url: myUrl!) {
        response, error in
        completion(response as? [Profile], error)
    }
}

func searchUsers(text: String, completion: @escaping (_ profiles: [Profile]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "searchusers/"
    let urlWithParams = scriptUrl + "?string=\(text)"
    let myUrl = URL(string: urlWithParams)
    dataTaskUsers(url: myUrl!) {
        response, error in
        completion(response as? [Profile], error)
    }
}

func searchLabs(text: String, completion: @escaping (_ profiles: [Lab]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "searchlabs/"
    let urlWithParams = scriptUrl + "?string=\(text)"
    let myUrl = URL(string: urlWithParams)
    dataTaskLabs(url: myUrl!) {
        response, error in
        completion(response as? [Lab], error)
    }
}

func searchProjects(text: String, completion: @escaping (_ profiles: [Lab]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "searchprojects/"
    let urlWithParams = scriptUrl + "?string=\(text)"
    let myUrl = URL(string: urlWithParams)
    dataTaskLabs(url: myUrl!) {
        response, error in
        completion(response as? [Lab], error)
    }
}

func searchEvents(text: String, completion: @escaping (_ profiles: [Lab]?, _ error: Int?) -> Void) {
    let scriptUrl = SERVER_URL + "searchevents/"
    let urlWithParams = scriptUrl + "?string=\(text)"
    let myUrl = URL(string: urlWithParams)
    dataTaskLabs(url: myUrl!) {
        response, error in
        completion(response as? [Lab], error)
    }
}

//
//  LoginManager.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import Foundation

let LOGIN_HARDCODE_ISUPOV = "isupov"
let LOGIN_HARDCODE_KURAPOV = "kurapov"
let PASSWORD_HARDCODE = "123"

class LoginManager {
    
    var loginInput: String?
    var passwordInput: String?
    
    init() {
        loginInput = nil
        passwordInput = nil
    }
    
    func check() -> Bool {
        if let login = loginInput, let password = passwordInput {
            if login == LOGIN_HARDCODE_ISUPOV && password == PASSWORD_HARDCODE {
                setUser(isupov: true)
                return true
            }
            if login == LOGIN_HARDCODE_KURAPOV && password == PASSWORD_HARDCODE {
                setUser(isupov: false)
                return true
            }
        }
        return false
    }
    
    var isLoggedIn: Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func setLoggedIn(logged: Bool) {
        UserDefaults.standard.set(logged, forKey: "isLoggedIn")
    }
    
    func setUser(isupov: Bool) {
        UserDefaults.standard.set(isupov, forKey: "who")
    }
    
    var isIsupovLogin: Bool {
        return UserDefaults.standard.bool(forKey: "who")
    }
    
    func saveServer(text: String?) {
        if let text = text, text != "" {
            UserDefaults.standard.set(text, forKey: "serverURL")
        } else {
            UserDefaults.standard.set(SERVER_URL, forKey: "serverURL")
        }
    }
    var server: String {
        return UserDefaults.standard.value(forKey: "serverURL") as! String
    }
    
    
}

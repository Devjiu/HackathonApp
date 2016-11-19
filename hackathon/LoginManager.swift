//
//  LoginManager.swift
//  hackathon
//
//  Created by sisupov on 19.11.16.
//  Copyright © 2016 sisupov. All rights reserved.
//

import Foundation

let LOGIN_HARDCODE = "abc"
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
            if login == LOGIN_HARDCODE && password == PASSWORD_HARDCODE {
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
    
    
    
}

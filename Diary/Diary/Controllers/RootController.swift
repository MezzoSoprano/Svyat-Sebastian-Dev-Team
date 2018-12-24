//
//  RootController.swift
//  Diary
//
//  Created by Sebastian on /24/12/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit
import Locksmith

class RootController {
    func logIn(username: String, password: String) -> Bool {
        let dictionary = Locksmith.loadDataForUserAccount(userAccount: "myAccount")
        if (username == dictionary?["login"] as? String  && password == (dictionary?["password"] as! String)) {
            return true
        }
        else {
            return false
        }
    }
    func signUp(username: String, password: String) -> Bool {
        do {
            try Locksmith.saveData(data: ["login" : username, "password" : password], forUserAccount: "myAccount")
            return true
        } catch {
            print("unable to save data")
            return false
        }
    }
}

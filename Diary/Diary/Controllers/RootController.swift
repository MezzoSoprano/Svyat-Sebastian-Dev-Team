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
        let dictionary = Locksmith.loadDataForUserAccount(userAccount: username)
        if (username == dictionary?["login"] as? String  && password == (dictionary?["password"] as! String)) {
            print("false1")
            return true
        }
        else {
            print("false")
            return false
        }
    }
}

//
//  SignUpController.swift
//  Diary
//
//  Created by Sebastian on /26/12/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit
import Locksmith

class SignUpController {
    
    func signUp(name: String, lastName: String, age: Int, email: String, password: String, gender: String) -> Bool {
        do {
            try Locksmith.saveData(data: ["login" : email, "password" : password], forUserAccount: name)
            print(Locksmith.loadDataForUserAccount(userAccount: name)!)
            return true
        }
        catch {
            print("unable to save data")
            return false
        }
    }
}

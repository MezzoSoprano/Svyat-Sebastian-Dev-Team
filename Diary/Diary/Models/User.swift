//
//  User.swift
//  Diary
//
//  Created by Sebastian on /25/12/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

enum Gender {
    case Male
    case Female
    case Other
}

class user {
    var name: String
    var lastName: String
    var age: Int
    var email: String
    var gender: Gender
    
    init (name: String, lastName: String, age: Int, email: String, gender: Gender) {
        self.name = name
        self.lastName = lastName
        self.age = age
        self.email = email
        self.gender = gender
    }
    
}


//class user {
//    var email: String
//    var notes: [DiaryNote?]
//
//    init (email: String, notes: [DiaryNote?]) {
//        self.email = email
//        self.notes = notes
//    }
//}

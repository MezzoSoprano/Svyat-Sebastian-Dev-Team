//
//  File.swift
//  Diary
//
//  Created by Святослав Катола on 12/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import Foundation

class CodableNote: Codable {
    
    var name: String
    var text: String
    var date: String?
    var imageURL: String
    
    init (name: String, text: String, imageURL: String) {
        self.name = name
        self.text = text
        self.imageURL = imageURL
    }
}


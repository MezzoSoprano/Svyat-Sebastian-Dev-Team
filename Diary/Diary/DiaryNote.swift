//
//  DiaryNote.swift
//  Diary
//
//  Created by Святослав Катола on 11/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class DiaryNote {
    
    let creationDate: Date = Date()
    
    var creationDateFormatted: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.locale = Locale(identifier: "uk_UA")
            return dateFormatter.string(from: creationDate)
        }
    }
    
    var name: String? {
        didSet {
            if name != oldValue && oldValue != nil && name != nil {
                let editingDate = Date()
                print("Ім'я \"\(oldValue!)\" нотатки було змінено на \"\(name!)\" о \(editingDate)")
            }
        }
    }
    
    var text: String? {
        didSet {
            if text != oldValue && oldValue != nil && text != nil{
                let editingDate = Date()
                print("Текст нотатки \"\(name!)\" з \"\(oldValue!)\" був змінений на \"\(text!)\" о \(editingDate)")
            }
        }
    }
    
    var tags: [String]? {
        didSet {
            if tags != oldValue && oldValue != nil && tags != nil{
                let editingDate = Date()
                print("Теги \(oldValue!)  нотатки \"\(name!)\" були змінені на \"\(tags!)\" о \(editingDate)")
            }
        }
    }
    
    init ()
    {
        name = ""
        text = ""
        tags = [""]
    }
    
    init (name: String? = nil, text: String? = nil, tags: [String]? = nil)
    {
        self.name = name
        self.text = text
        self.tags = tags
        
    }
    
    func simpleDescription() -> String {
        
        let str1 = (name != nil ? "\"\(name!)\" \n\n" : "") + (text != nil ? "\(text!) \n\n" : "") + "\n\n \(creationDateFormatted)"
        
        
        var str2: String = ""
        if let temp = tags {
            for str in temp
            {
                str2 += "["+str+"]"
            }
        }
        return str1 + str2
    }
}

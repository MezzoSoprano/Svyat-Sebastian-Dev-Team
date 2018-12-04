//
//  DiaryNote.swift
//  Diary
//
//  Created by Святослав Катола on 11/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class DiaryNote: NSObject, NSCoding {
    
    let creationDate: Date = Date()
    
    var creationDateFormatted: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.locale = Locale(identifier: "uk_UA")
            return dateFormatter.string(from: creationDate)
        }
    }
    
    var image: UIImage?
    
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
    
    override init ()
    {
        name = ""
        text = ""
        tags = [""]
    }
    
    init (name: String? = nil, text: String? = nil, tags: [String]? = nil, image: UIImage? = nil)
    {
        self.name = name
        self.text = text
        self.tags = tags
        self.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String
        text = aDecoder.decodeObject(forKey: "text") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(text, forKey: "text")
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

class user {
    var email: String
    var notes: [DiaryNote?]
    
    init(email: String, notes: [DiaryNote?]) {
        self.email = email
        self.notes = notes
    }
}

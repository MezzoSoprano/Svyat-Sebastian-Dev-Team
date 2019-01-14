//
//  View-Controller.swift
//  Diary
//
//  Created by Sebastian on /24/12/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

var list: [DiaryNote] = []
var favoriteList: [DiaryNote] = []
let coreData = CoreDataStack()

var selectedItemIndex: Int?

class MainController {
    func deleteAt(at: Int) {
        coreData.delete(at: at)
        
        if let index = favoriteList.firstIndex(where: {$0 === list[at]}) {
            favoriteList.remove(at: index)
        }
        list.remove(at: at)
    }
}

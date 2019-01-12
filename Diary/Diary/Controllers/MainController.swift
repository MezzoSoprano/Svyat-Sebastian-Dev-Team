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
        list.remove(at: at)
    }
}

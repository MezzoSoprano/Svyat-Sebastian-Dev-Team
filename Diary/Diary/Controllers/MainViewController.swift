//
//  View-Controller.swift
//  Diary
//
//  Created by Sebastian on /24/12/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

var list: [DiaryNote] = []
let coreData = CoreDataStack()

var selectedItemIndex: Int?

class MainViewController {
    func deleteAt(at: Int) {
        coreData.delete(at: at)
        list.remove(at: at)
    }
}
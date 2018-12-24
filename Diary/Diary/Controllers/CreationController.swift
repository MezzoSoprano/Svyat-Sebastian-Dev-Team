//
//  CreationController.swift
//  Diary
//
//  Created by Sebastian on /24/12/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class CreationController {
    func addToList(note: DiaryNote) {
        coreData.add(name: note.name!, text: note.text!, image: note.image)
        list.append(DiaryNote(name: note.name!, text: note.text!, image: note.image))
    }
}

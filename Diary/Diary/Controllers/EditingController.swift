//
//  EditingController.swift
//  Diary
//
//  Created by Sebastian on /24/12/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class EditingController {
    
    func deleteFromList() {
        list.remove(at: selectedItemIndex!)
        coreData.delete()
    }
    func modNote(note: DiaryNote) {
        coreData.edit(name: note.name!, text: note.text!, image: note.image)
        
        list[selectedItemIndex!].name = note.name
        list[selectedItemIndex!].text = note.text
        list[selectedItemIndex!].image = note.image
    }
}

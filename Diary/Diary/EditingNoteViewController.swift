//
//  EditingNoteViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/20/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class EditingNoteViewController: UIViewController {

    var recivedItemIndex: Int?
    
    @IBOutlet weak var editingName: UITextField!
    @IBOutlet weak var editingText: UITextView!
    @IBOutlet weak var deleteOutlet: UIButton!
    @IBOutlet weak var editingPicture: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let recivedIndex = recivedItemIndex else {
            print("Couldnt get index")
            return
        }
        
        self.view.backgroundColor = Settings.currentTheme.accent
        editingName.text = list[recivedIndex].name
        editingText.text = list[recivedIndex].text
        
        deleteOutlet.setCellShadow()
        deleteOutlet.showsTouchWhenHighlighted = true
        deleteOutlet.backgroundColor = Settings.currentTheme.background
        
        editingName.setCellShadow()
        editingText.isScrollEnabled = true
        editingName.backgroundColor = Settings.currentTheme.background
        editingText.backgroundColor = Settings.currentTheme.background
        
        editingPicture.setCellShadow()
        editingPicture.backgroundColor = Settings.currentTheme.background
        editingPicture.backgroundColor = Settings.currentTheme.background
    }

    @IBAction func deleteAction(_ sender: Any) {
        guard let recivedIndex = recivedItemIndex else {
            print("Couldnt get index")
            return
        }
        list.remove(at: recivedIndex)
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func saveEditingNote(_ sender: Any) {
        guard let recivedIndex = recivedItemIndex else {
            print("Couldnt get index")
            return
        }
        
        list[recivedIndex].name = editingName.text
        list[recivedIndex].text = editingText.text
    }
}

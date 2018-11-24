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
    
    @IBAction func deleteAction(_ sender: Any) {
        guard let recivedIndex = recivedItemIndex else {
            print("Couldnt get index")
            return
        }
        list.remove(at: recivedIndex)
        _ = navigationController?.popViewController(animated: true)

    }
    
    @IBOutlet weak var editingName: UITextField!
    
    @IBOutlet weak var editingText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let recivedIndex = recivedItemIndex else {
            print("Couldnt get index")
            return
        }
        
        editingName.text = list[recivedIndex].name
        editingText.text = list[recivedIndex].text
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

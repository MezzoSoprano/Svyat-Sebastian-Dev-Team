//
//  EditingNoteViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/20/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class EditingNoteViewController: UIViewController {

    var recivedName: String = ""
    
    @IBAction func deleteAction(_ sender: Any) {
        
    }
    @IBOutlet weak var editingName: UITextField!
    
    @IBOutlet weak var editingText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editingName.text = recivedName
    }
    

}

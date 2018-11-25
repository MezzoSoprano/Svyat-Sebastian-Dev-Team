//
//  CreationViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var InputName: UITextField!
    @IBOutlet weak var InputText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(r: 184, g: 176, b: 170)
        InputName.backgroundColor = backGroundColor
        InputText.backgroundColor = backGroundColor
    }
    
    @IBAction func addButton(_ sender: Any) {
        if InputName.text != "" && InputText.text != "" {
            list.append(DiaryNote(name: InputName.text, text: InputText.text))
            InputText.text = ""
            InputName.text = ""
        }
    }
}

//
//  CreationViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputText: UITextView!
    @IBOutlet weak var inputImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Settings.currentTheme.accent
        inputName.backgroundColor = Settings.currentTheme.background
        inputImage.backgroundColor = Settings.currentTheme.background
        inputText.backgroundColor = Settings.currentTheme.background
    }
    
    @IBAction func addButton(_ sender: Any) {
        if inputName.text != "" && inputText.text != "" {
            list.append(DiaryNote(name: inputName.text, text: inputText.text))
            inputText.text = ""
            inputName.text = ""
        }
    }
}

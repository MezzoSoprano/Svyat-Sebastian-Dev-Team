//
//  CreationViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit
import CoreData

class CreationViewController: UIViewController {
    
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputText: UITextView!
    @IBOutlet weak var inputImage: UIImageView!
    
    let coreData = CoreDataStack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Settings.currentTheme.accent
        
        inputText.setCellShadow()
        inputText.backgroundColor = Settings.currentTheme.background
        inputText.isScrollEnabled = true
        
        inputName.setCellShadow()
        inputName.backgroundColor = Settings.currentTheme.background

        inputImage.setCellShadow()
        inputImage.backgroundColor = Settings.currentTheme.background
    }
    
    @IBAction func addButton(_ sender: Any) {
        if inputName.text != "" && inputText.text != "" {
            
            coreData.add(name: inputName.text!, text: inputText.text!)
            list.append(DiaryNote(name: inputName.text, text: inputText.text))
            inputText.text = ""
            inputName.text = ""
        }
    }
}

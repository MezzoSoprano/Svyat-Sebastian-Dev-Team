//
//  CreationViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputText: UITextView!
    @IBOutlet weak var inputImage: UIImageView!
    @IBOutlet weak var importImageOutlet: UIButton!
    
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
        
        importImageOutlet.setCellShadow()
        importImageOutlet.showsTouchWhenHighlighted = true
        importImageOutlet.backgroundColor = Settings.currentTheme.background
    }
    
    @IBAction func addButton(_ sender: Any) {
        if inputName.text != "" && inputText.text != "" {
            list.append(DiaryNote(name: inputName.text, text: inputText.text, image: inputImage.image))
            inputText.text = ""
            inputName.text = ""
            inputImage.image = nil
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            inputImage.image = image
        } else {
            print("Couldn't get image")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        self.present(image, animated: true)
    }
}

//
//  EditingNoteViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/20/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class EditingNoteViewController: UIViewController, UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
        editingPicture.image = list[recivedIndex].image
        
        deleteOutlet.setCellShadow()
        deleteOutlet.showsTouchWhenHighlighted = true
        deleteOutlet.backgroundColor = Settings.currentTheme.background
        
        editingName.setCellShadow()
        editingName.backgroundColor = Settings.currentTheme.background
        
        editingText.setCellShadow()
        editingText.isScrollEnabled = true
        editingText.backgroundColor = Settings.currentTheme.background
        
        editingPicture.setCellShadow()
        editingPicture.backgroundColor = Settings.currentTheme.background
        
        //enabling photo picking when photo clicked
//        var UITapRecognizer = UITapGestureRecognizer(target: self, action: "tappedImage:")
//        UITapRecognizer.delegate = self
//        self.editingPicture.addGestureRecognizer(UITapRecognizer)
//        self.editingPicture.isUserInteractionEnabled = true
        
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
        list[recivedIndex].image = editingPicture.image
    }
    
    @IBAction func imageTapped(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            editingPicture.image = image
        } else {
            print("Couldn't get image")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}

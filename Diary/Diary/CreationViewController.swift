//
//  CreationViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        if InputName.text != "" && InputText.text != "" {
            list.append(DiaryNote(name: InputName.text, text: InputText.text))
            InputText.text = ""
            InputName.text = ""
        }
        
            
    }
    
    @IBOutlet weak var InputName: UITextField!
    @IBOutlet weak var InputText: UITextView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

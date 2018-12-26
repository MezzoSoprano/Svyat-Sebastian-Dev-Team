//
//  SignUpViewController.swift
//  Diary
//
//  Created by Sebastian on /26/12/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var genderPickerOutlet: UITextField!
    @IBOutlet weak var nameTFOutlet: UITextField!
    @IBOutlet weak var lastNameOutlet: UITextField!
    @IBOutlet weak var emailTFOutlet: UITextField!
    @IBOutlet weak var passwordTFOutlet: UITextField!
    @IBOutlet weak var ageTFOutlet: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    let genders = [ "Male", "Female", "Other"]
    var pickedGender: String?
    let controller = SignUpController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backBtn.layer.cornerRadius = 5
        signUpBtn.layer.cornerRadius = 5
        setupGenderPicker()
        setUpToolbar()
    }
    
    func setupGenderPicker() {
        
        let genderPicker = UIPickerView()
        genderPicker.delegate = self
        genderPicker.backgroundColor = .lightGray
        
        genderPickerOutlet.inputView = genderPicker
    }
    
    func setUpToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.backgroundColor = UIColor.darkGray
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SignUpViewController.dismissPicker))
        
        toolBar.setItems([doneBtn], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        genderPickerOutlet.inputAccessoryView = toolBar
    }
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    @IBAction func SignUp(_ sender: Any) {
        if (nameTFOutlet.text != "" || lastNameOutlet.text != "" || ageTFOutlet.text != "" || emailTFOutlet.text != "" || passwordTFOutlet.text != "") {
            if (controller.signUp(name: nameTFOutlet.text!, lastName: lastNameOutlet.text!, age: Int(ageTFOutlet.text!)!, email: emailTFOutlet.text!, password: passwordTFOutlet.text!, gender: genderPickerOutlet.text!)) {
                performSegue(withIdentifier: "segueToTutorial", sender: nil)
            }
            else {
                createAlert(title: "ERROR", message: "Already exists")
            }
        }
        else {
            createAlert(title: "ERROR", message: "Please enter all fields")
        }
    }
    
    
    @IBAction func Back(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! RootViewController
        self.present(controller, animated: true, completion: { () -> Void in
        })
    }
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension SignUpViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedGender = genders[row]
        genderPickerOutlet.text = pickedGender
    }
}

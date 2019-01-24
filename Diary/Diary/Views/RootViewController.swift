//
//  RootViewController.swift
//  Diary
//
//  Created by Святослав Катола on 12/4/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit
import Locksmith

class RootViewController: UIViewController {

    @IBOutlet weak var SignInUotlet: UIButton!
    @IBOutlet weak var SignUpOutlet: UIButton!
    @IBOutlet weak var logintTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    let controller = RootController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SignInUotlet.layer.cornerRadius = 5
        
        self.hideKeyboardWhenTappedAround() 
    }
    
    @objc func successAction() {
        performSegue(withIdentifier: "segueToMain", sender: nil)
    }
    
    func animation() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.SignInUotlet.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.SignInUotlet.backgroundColor = .lightGray
            self.SignInUotlet.layer.shadowColor = UIColor.black.cgColor
            self.SignInUotlet.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.SignInUotlet.layer.shadowOpacity = 2
            self.SignInUotlet.layer.shadowRadius = 2.0
            self.SignInUotlet.layer.masksToBounds = false
            self.SignInUotlet.layer.cornerRadius = 3

        }) { (isFinished) in
            let successfulBtn = self.SignInUotlet
            successfulBtn?.setTitle("Success!", for: UIControl.State.normal)
            successfulBtn?.addTarget(self, action: #selector(self.successAction), for: UIControl.Event.touchUpInside)
            
        }
        
    }
    

    @IBAction func SignIn(_ sender: Any) {
        if (controller.logIn(username: logintTF.text!, password: passwordTF.text!)) {
            animation()
        }
        else if (logintTF.text == "" || passwordTF.text == "") {
            self.createAlert(title: "ERROR", message: "Please enter password and login")
        }
        else {
            self.createAlert(title: "ERROR", message: "Password or/and login are incorrect")
        }
    }
    
    @IBAction func SignUp(_ sender: Any) {
        performSegue(withIdentifier: "segueToSignUp", sender: nil)
    }
}

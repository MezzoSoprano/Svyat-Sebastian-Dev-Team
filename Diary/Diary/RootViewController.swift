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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SignInUotlet.layer.cornerRadius = 3
        SignUpOutlet.layer.cornerRadius = 3
    }
    
    //!!!
    //login: login
    //password: password
    @IBAction func SignIn(_ sender: Any) {
        let dictionary = Locksmith.loadDataForUserAccount(userAccount: "myAccount")
        
        if (logintTF.text == dictionary?["login"] as? String  && passwordTF.text == (dictionary?["password"] as! String)) {
            performSegue(withIdentifier: "segueToStarterView", sender: nil)
        }
        else if (logintTF.text == "" || passwordTF.text == "") {
            createAlert(title: "ERROR", message: "Please enter password and login")
        }
        else {
            createAlert(title: "ERROR", message: "Password or/and login are incorrect")
        }
    }
    
    @IBAction func SignUp(_ sender: Any) {
        //performSegue(withIdentifier: "segueToStarterView", sender: nil)
        if let login = logintTF.text, let password = passwordTF.text {
            do {
                try Locksmith.saveData(data: ["login" : login, "password" : password], forUserAccount: "myAccount")
            } catch {
                print("unable to save data")
                createAlert(title: "ERROR", message: "Already exists")
            }
        }
    }
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

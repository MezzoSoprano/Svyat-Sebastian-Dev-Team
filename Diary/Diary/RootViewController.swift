//
//  RootViewController.swift
//  Diary
//
//  Created by Святослав Катола on 12/4/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var SignInUotlet: UIButton!
    @IBOutlet weak var SignUpOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SignInUotlet.layer.cornerRadius = 3
        SignUpOutlet.layer.cornerRadius = 3
    }

    @IBAction func SignIn(_ sender: Any) {
        performSegue(withIdentifier: "segueToStarterView", sender: nil)
    }
    
    @IBAction func SignUp(_ sender: Any) {
        performSegue(withIdentifier: "segueToStarterView", sender: nil)
    }
}

//
//  SettingsViewController.swift
//  Diary
//
//  Created by Святослав Катола on 12/1/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        a()
    }
    
    @IBAction func themeChanged(_ sender: UISwitch) {
        if sender.isOn {
            Theme.currentTheme = LightTheme()
        }   else {
            Theme.currentTheme = DarkTheme()
        }
        
        a()
    }
    
    fileprivate func a() {
        view.backgroundColor = Theme.currentTheme.background
        self.navigationController?.navigationBar.barTintColor = Theme.currentTheme.background
    }
}

class Settings {
    
}

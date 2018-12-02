//
//  SettingsViewController.swift
//  Diary
//
//  Created by Святослав Катола on 12/1/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
     @IBOutlet weak var themeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        themeSwitch.isOn = (Settings.currentTheme.accent == .white) ? true : false //govnogod
    }
    
    @IBAction func themeChanged(_ sender: UISwitch) {
        Settings.currentTheme = sender.isOn ? LightTheme() : DarkTheme()
        
        UserDefaults.standard.set(sender.isOn, forKey: "LightTheme")
        applyTheme()
    }
    
    fileprivate func applyTheme() {
        view.backgroundColor = Settings.currentTheme.background
        self.navigationController?.navigationBar.barTintColor = Settings.currentTheme.background
    }
}

class Settings {
    static var currentTheme: ThemeProtocol = LightTheme()
}

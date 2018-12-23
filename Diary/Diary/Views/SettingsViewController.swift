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
    @IBOutlet weak var viewSwitch: UISwitch!
    let controller = settingsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        themeSwitch.isOn = (Settings.currentTheme.accent == .white) ? true : false //govnogod
        viewSwitch.isOn = (Settings.isCollectionView == false) ? false : true
    }
    
    @IBAction func themeChanged(_ sender: UISwitch) {
        controller.changeTheme(state: sender.isOn)
        applyTheme()
    }
    
    fileprivate func applyTheme() {
        view.backgroundColor = Settings.currentTheme.background
        self.navigationController?.navigationBar.barTintColor = Settings.currentTheme.background
    }
    
    @IBAction func viewChanger(_ sender: UISwitch) {
        controller.changeView(state: sender.isOn);
    }
}

class Settings {
    static var currentTheme: ThemeProtocol = LightTheme()
    static var isCollectionView = false
}

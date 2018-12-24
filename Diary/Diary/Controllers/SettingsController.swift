//
//  File.swift
//  Diary
//
//  Created by Sebastian on /23/12/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

//protocol settingsDelegate {
//    func changeTheme(state: Bool)
//    func changeContainer(state: Bool)
//}

class settingsController {
    func changeTheme(state: Bool) {
        Settings.currentTheme = state ? LightTheme() : DarkTheme()
        UserDefaults.standard.set(state, forKey: "LightTheme")
    }
    
    func changeView(state: Bool) {
        Settings.isCollectionView = state
        UserDefaults.standard.set(state, forKey: "CollectionView")
    }
}

class Settings {
    static var currentTheme: ThemeProtocol = LightTheme()
    static var isCollectionView = false
}

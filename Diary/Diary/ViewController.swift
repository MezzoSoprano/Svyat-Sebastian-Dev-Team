//
//  ViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

var list = [DiaryNote(name: "Завтра в школу", text: "Ужас", image: UIImage(named: "dude")), DiaryNote(name: "Ujac", text: "Ужас", image: UIImage(named: "landscape")), DiaryNote(name: "Hi man", text: "Ужас", image: UIImage(named: "landscape2")), DiaryNote(name: "Make HW", text: "Immediately"), DiaryNote(name: "Завтра в школу", text: "Ужас"), DiaryNote(name: "Ujac", text: "Ужас"),DiaryNote(name: "Hi man", text: "Ужас")]

var selectedItemIndex: Int?

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var tableView = UITableView()
    var tableViewConstraints: [NSLayoutConstraint] = []
    let tableCellID = "CellID"
    var collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewLayout.init()) //sorry
    let collectionCellID = "CCellID"
    let segueIdentifierPassingData = "segueForPassingData"
    let segueIdentifierCreatingNote = "segurForCreatingNote"
    let segueIdentifierSettings = "settingsSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = Settings.currentTheme.background
    }
    
    private func setupTableView() {
        self.view.addSubview(tableView)
        
        tableView.register(tableCell.self, forCellReuseIdentifier: tableCellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        //constarints adding
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: self.view.safeLeftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.safeRightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.safeTopAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeBottomAnchor).isActive = true
    }
    
    private func setupCollectionView() {
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        self.view.addSubview(collectionView)
        
        collectionView.register(customCollectionCell.self, forCellWithReuseIdentifier: collectionCellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = Settings.currentTheme.background

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: self.view.safeLeftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.safeRightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.view.safeTopAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeBottomAnchor).isActive = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if(Settings.isCollectionView == true)
        {
            tableView.removeFromSuperview()
            collectionView.reloadData()
        } else {
            collectionView.removeFromSuperview()
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if(Settings.isCollectionView == true)
        {
            setupCollectionView()
            collectionView.backgroundColor = Settings.currentTheme.background
        } else {
            setupTableView()
            tableView.backgroundColor = Settings.currentTheme.background
        }
        self.view.backgroundColor = Settings.currentTheme.background
    }
    ////////////////////////////////
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! customCollectionCell
        myCell.nameLabel.text = list[indexPath.row].name
        myCell.textLabel.text = list[indexPath.row].text
        myCell.pictureImageView.image = list[indexPath.row].image
        return myCell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItemIndex = indexPath.row
        self.performSegue(withIdentifier: segueIdentifierPassingData, sender: nil)
    }
    /////////////////////////////////
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifierPassingData {
                let detailVC = segue.destination as! EditingNoteViewController
            guard let itemTemp = selectedItemIndex else {
                print("Couldn't get selected index")
                return
        }
            detailVC.recivedItemIndex = itemTemp
    }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItemIndex = indexPath.row
        self.performSegue(withIdentifier: segueIdentifierPassingData, sender: nil)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Note was deleted: \(list[indexPath.row].name ?? "couldn't get note")")
            list.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath) as! tableCell
        cell.nameLabel.text = list[indexPath.row].name
        cell.textView.text = list[indexPath.row].text
        cell.pictureImageView.image = list[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let applyThemeCell = cell as! tableCell
        applyThemeCell.applyTheme()
    }
    
    @IBAction func createNewNote(_ sender: Any) {
        performSegue(withIdentifier: segueIdentifierCreatingNote, sender: nil)
    }
    
    @IBAction func openSettings(_ sender: Any) {
        performSegue(withIdentifier: segueIdentifierSettings, sender: nil)
    }
}


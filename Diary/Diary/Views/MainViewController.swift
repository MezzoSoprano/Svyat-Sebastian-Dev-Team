//
//  ViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var tableView = UITableView()
    var tableViewConstraints: [NSLayoutConstraint] = []
    let tableCellID = "CellID"
    var collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewLayout.init())
    let collectionCellID = "CCellID"
    let segueIdentifierPassingData = "segueForPassingData"
    let segueIdentifierCreatingNote = "segurForCreatingNote"
    let segueIdentifierSettings = "settingsSegue"
    let controller = MainController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreData.load()
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
            collectionView.reloadData() //C should maybe be involved
        } else {
            collectionView.removeFromSuperview()
            tableView.reloadData() //
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
        self.navigationController?.navigationBar.barTintColor = Settings.currentTheme.background
        self.tabBarController?.tabBar.barTintColor = Settings.currentTheme.background
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { //C
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! customCollectionCell
        if (list[indexPath.row].favorite == true) {
            myCell.starButton.tintColor = .red
        } else {
            myCell.starButton.tintColor = .lightGray
        }
        myCell.nameLabel.text = list[indexPath.row].name
        myCell.textLabel.text = list[indexPath.row].text
        myCell.pictureImageView.image = list[indexPath.row].image
        myCell.mainLink = self
        return myCell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItemIndex = indexPath.row
        self.performSegue(withIdentifier: segueIdentifierPassingData, sender: nil) //C maybe
    }

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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //C
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath) as! tableCell
        cell.nameLabel.text = list[indexPath.row].name
        cell.textView.text = list[indexPath.row].text
        cell.pictureImageView.image = list[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let like = UITableViewRowAction(style: .normal, title: "Like") { (UITableViewRowAction, IndexPath) in
            if (list[indexPath.row].favorite == false) {
            list[indexPath.row].favorite = true
            favoriteList.append(list[indexPath.row])
            print("Note was liked: \(list[indexPath.row].name ?? "couldn't get note name ")")
        }
            else {
                self.createAlert(title: "Already liked", message: "The note is in yout favorite list already")
            }
    }
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { (UITableViewRowAction, IndexPath) in
            print("Note was deleted: \(list[indexPath.row].name ?? "couldn't get note")")
            self.controller.deleteAt(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        delete.backgroundColor = .red
        return [like, delete]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let applyThemeCell = cell as! tableCell
        applyThemeCell.applyTheme()
    }
    
    func addToFavorite(cell: UICollectionViewCell) {
        guard let indexPathTapped = collectionView.indexPath(for: cell) else { return }
        
        let mcell = cell as! customCollectionCell
        if (mcell.starButton.tintColor != .red) {
            mcell.starButton.tintColor = .red
            list[indexPathTapped.row].favorite = true
            favoriteList.append(list[indexPathTapped.row])
            print("Note was liked: \(list[indexPathTapped.row].name ?? "couldn't get note name ")")
        }
        else {
            mcell.starButton.tintColor = .lightGray
            print("Note was unliked: \(list[indexPathTapped.row].name ?? "couldn't get note name ")")
            list[indexPathTapped.row].favorite = false
            favoriteList.removeAll(where: { $0 === list[indexPathTapped.row]})
        }
    }
    
    @IBAction func createNewNote(_ sender: Any) {
        performSegue(withIdentifier: segueIdentifierCreatingNote, sender: nil) //C
    }
    
    @IBAction func openSettings(_ sender: Any) {
        performSegue(withIdentifier: segueIdentifierSettings, sender: nil) //C
    }
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 30) / 2, height: 350)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

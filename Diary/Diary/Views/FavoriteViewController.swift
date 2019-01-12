//
//  FavoriteViewController.swift
//  Diary
//
//  Created by Святослав Катола on 1/12/19.
//  Copyright © 2019 mezzoSoprano. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {

    var tableView = UITableView()
    var tableViewConstraints: [NSLayoutConstraint] = []
    let tableCellID = "CellID"
    var collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewLayout.init())
    let collectionCellID = "CCellID"

    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return favoriteList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { //C
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! customCollectionCell
        myCell.starButton.tintColor = .red
        myCell.nameLabel.text = favoriteList[indexPath.row].name
        myCell.textLabel.text = favoriteList[indexPath.row].text
        myCell.pictureImageView.image = favoriteList[indexPath.row].image
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfRowsInSection section: Int) -> Int {
        return favoriteList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteList.count
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let addTofavorite = UITableViewRowAction(style: .normal, title: "Unlike") { (UITableViewRowAction, IndexPath) in
            print("Note was unliked: \(favoriteList[indexPath.row].name ?? "couldn't get note name ")")
            list[indexPath.row].favorite = false
            favoriteList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [addTofavorite]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //C
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath) as! tableCell
        cell.nameLabel.text = favoriteList[indexPath.row].name
        cell.textView.text = favoriteList[indexPath.row].text
        cell.pictureImageView.image = favoriteList[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let applyThemeCell = cell as! tableCell
        applyThemeCell.applyTheme()
    }
}

extension FavoriteViewController : UICollectionViewDelegateFlowLayout {
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


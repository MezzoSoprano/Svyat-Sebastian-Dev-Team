//
//  ViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

var list = [DiaryNote(name: "Завтра в школу", text: "Ужас"), DiaryNote(name: "Ujac", text: "Ужас"),DiaryNote(name: "Hi man", text: "Ужас"), DiaryNote(name: "Make HW", text: "Immediately") ]
var selectedItemIndex: Int?

var backGroundColor: UIColor = UIColor(r: 128, g: 126, b: 124)

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var tableViewConstraints: [NSLayoutConstraint] = []
    let tableCellID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView() //creating tableView with constraints
        
    }
    
    private func setupTableView() {
        self.view.addSubview(tableView)
        tableView.register(tableCell.self, forCellReuseIdentifier: tableCellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = backGroundColor
        
        //constarints adding
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueForPassingData" {
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
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectedItemIndex = indexPath.row
        self.performSegue(withIdentifier: "segueForPassingData", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            print("Note was deleted: \(list[indexPath.row].name ?? "default value")")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath) as! tableCell
        cell.nameLabel.text = list[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

class tableCell: UITableViewCell {
    let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 184, g: 176, b: 170)
        view.setCellShadow()
        return view
    }()
    
    var pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .gray
        iv.layer.cornerRadius = 35
        return iv
    }()
    
    var textView: UITextView = {
        let tvi = UITextView()
        tvi.translatesAutoresizingMaskIntoConstraints = false
        tvi.textColor = UIColor.darkGray
        return tvi
    }()
    
    var nameLabel: UILabel = {
        let la = UILabel()
        la.translatesAutoresizingMaskIntoConstraints = false
        la.textColor = UIColor.darkGray
        return la
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.backgroundColor = backGroundColor
        setup()
    }

    func setup() {
        addSubview(cellView)
        cellView.addSubview(self.pictureImageView)
        cellView.addSubview(self.nameLabel)
        cellView.addSubview(self.textView)
        
        //cellview constraits
        cellView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        cellView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        
        //image constraits
        pictureImageView.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 8).isActive = true
        pictureImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        pictureImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        pictureImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
        //name label constraits
        nameLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.centerYAnchor.constraint(equalToSystemSpacingBelow: cellView.centerYAnchor, multiplier: 1/2)
        
        //text vew constraits
//        textView.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
//        textView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        textView.widthAnchor.constraint(equalToConstant: 400).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

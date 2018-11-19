//
//  ViewController.swift
//  Diary
//
//  Created by Святослав Катола on 11/19/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

var list = [DiaryNote(name: "Завтра в школу", text: "Ужас"), DiaryNote()]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row].simpleDescription()
        return (cell)
    }
    override func viewDidAppear(_ animated: Bool) {
        MyTableView.reloadData()
    }

    @IBOutlet weak var MyTableView: UITableView!
    
    @IBAction func editButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //styles
    }


}


//
//  TableViewCell.swift
//  Diary
//
//  Created by Святослав Катола on 11/25/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class tableCell: UITableViewCell, UITextFieldDelegate {
    
    let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setCellShadow()
        return view
    }()
    
    var pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 35
        iv.clipsToBounds = true
        return iv
    }()
    
    var textView: UITextView = {
        let tvi = UITextView()
        tvi.setCellShadow()
        tvi.translatesAutoresizingMaskIntoConstraints = false
        tvi.isEditable = false
        tvi.isScrollEnabled = false
        
        return tvi
    }()
    
    var nameLabel: UILabel = {
        let la = UILabel()
        la.translatesAutoresizingMaskIntoConstraints = false
        return la
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textView.delegate = self as? UITextViewDelegate
        self.selectionStyle = .none
        
        applyTheme()
        setup()
    }
    
    func setup() {
        addSubview(cellView)
        cellView.addSubview(self.nameLabel)
        cellView.addSubview(self.textView)
        cellView.addSubview(self.pictureImageView)
        
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
        nameLabel.textAlignment = .center
        nameLabel.centerXAnchor.constraint(equalTo: textView.centerXAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: pictureImageView.rightAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -10).isActive = true
        
        //text view constraits
        textView.leftAnchor.constraint(equalTo: pictureImageView.rightAnchor, constant: 10).isActive = true
        textView.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -10).isActive = true
        textView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 35).isActive = true
        textView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10).isActive = true
    }
    
    func applyTheme() {
        self.backgroundColor = Settings.currentTheme.background
        self.nameLabel.textColor = Settings.currentTheme.tint
        self.textView.backgroundColor = Settings.currentTheme.accent
        self.pictureImageView.backgroundColor = Settings.currentTheme.tint
        self.cellView.backgroundColor = Settings.currentTheme.accent
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

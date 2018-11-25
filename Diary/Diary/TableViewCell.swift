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
        tvi.setCellShadow()
        tvi.translatesAutoresizingMaskIntoConstraints = false
        tvi.backgroundColor = UIColor(r: 184, g: 176, b: 170)
        tvi.isEditable = false
        return tvi
    }()
    
    var nameLabel: UILabel = {
        let la = UILabel()
        la.translatesAutoresizingMaskIntoConstraints = false
        la.textColor = .darkGray
        return la
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textView.delegate = self as? UITextViewDelegate
        self.selectionStyle = .none
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
        nameLabel.centerYAnchor.constraint(equalToSystemSpacingBelow: cellView.centerYAnchor, multiplier: 2)
        
        //text view constraits
        textView.leftAnchor.constraint(equalTo: pictureImageView.rightAnchor, constant: 10).isActive = true
        textView.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -10).isActive = true
        textView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 35).isActive = true
        textView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

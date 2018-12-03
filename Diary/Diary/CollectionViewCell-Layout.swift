//
//  CollectionViewCell.swift
//  Diary
//
//  Created by Sebastian on 12/2/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class customCollectionCell: UICollectionViewCell {
    let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = Settings.currentTheme.accent
        //view.setCellShadow()
        return view
    }()
    
    var pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = UIColor.lightText
        //iv.backgroundColor = Settings.currentTheme.tint
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    var nameLabel: UILabel = {
        let la = UILabel()
        la.translatesAutoresizingMaskIntoConstraints = false
        la.adjustsFontSizeToFitWidth = true
        //la.textColor = Settings.currentTheme.tint
        return la
    }()
    
    var dividerLine: UIView = {
        let div = UIView()
        div.translatesAutoresizingMaskIntoConstraints = false
        div.backgroundColor = UIColor.black
        return div
    }()
    
    var textLabel: UILabel = {
        let la = UILabel()
        la.translatesAutoresizingMaskIntoConstraints = false
        //la.textColor = Settings.currentTheme.tint
        return la
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyTheme()
        setup()
    }
    
    func setup() {
        addSubview(cellView)
        cellView.addSubview(self.pictureImageView)
        cellView.addSubview(self.nameLabel)
        cellView.addSubview(self.dividerLine)
        cellView.addSubview(self.textLabel)
        
        //cellview constraints
        cellView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        cellView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        cellView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        //image constraints
        pictureImageView.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        pictureImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        pictureImageView.leftAnchor.constraint(equalTo: cellView.leftAnchor).isActive = true
        pictureImageView.rightAnchor.constraint(equalTo: cellView.rightAnchor).isActive = true
        
        //name label constraints
        nameLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: 10).isActive = true
        
        //divider constraints
        dividerLine.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 5).isActive = true
        dividerLine.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -5).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        dividerLine.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 9).isActive = true
        
        //text view constraints
        textLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -10).isActive = true
        textLabel.topAnchor.constraint(equalTo: dividerLine.bottomAnchor, constant: 9).isActive = true
    }
    
    func applyTheme() {
        self.backgroundColor = Settings.currentTheme.background
        self.pictureImageView.backgroundColor = Settings.currentTheme.tint
        self.setCellShadow()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class customCollectionLayout: UICollectionViewLayout {
    
}

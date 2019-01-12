//
//  CollectionViewCell.swift
//  Diary
//
//  Created by Sebastian on 12/2/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit

class customCollectionCell: UICollectionViewCell {
    
     var link: MainViewController?
    
    let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var pictureImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = UIColor.lightText
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    var nameLabel: UILabel = {
        let la = UILabel()
        la.translatesAutoresizingMaskIntoConstraints = false
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
    
    var starButton: UIButton = {
        let image = UIImage(named: "fav_star")
        let starB = UIButton(type: .system)
        starB.setImage(image, for: .normal)
        starB.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        starB.tintColor = .lightGray
        return starB
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyTheme()
        setup()
    }
    
    @objc func like(sender: customCollectionCell)
    {
        link?.addToFavorite(cell: self)
    }
    
    func setup() {
        addSubview(cellView)
        cellView.addSubview(self.pictureImageView)
        cellView.addSubview(self.nameLabel)
        cellView.addSubview(self.dividerLine)
        cellView.addSubview(self.textLabel)
        
        self.starButton.addTarget(self, action: #selector (like(sender: )), for: .touchUpInside)
        cellView.addSubview(self.starButton)
        
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
        nameLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -10).isActive = true
        
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
        self.backgroundColor = Settings.currentTheme.accent
        self.pictureImageView.backgroundColor = Settings.currentTheme.tint
        self.setCellShadow()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class customCollectionLayout: UICollectionViewLayout {
    
}

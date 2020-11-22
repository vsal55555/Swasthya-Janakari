//
//  tableCell.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/2/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class tableCell: UITableViewCell {
    
    var tableImageView = UIImageView()
    var tableHeadTitleLabel = UILabel()
    var tableTailTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(tableImageView)
        addSubview(tableHeadTitleLabel)
        addSubview(tableTailTitleLabel)
        
        
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setHeadTitleLabelConstraints()
        setTailTitleLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cellinfo: cellInfo) {
        tableImageView.image = cellinfo.image
        tableImageView.contentMode = .scaleAspectFill
        tableHeadTitleLabel.text = cellinfo.title
        tableTailTitleLabel.text = cellinfo.topic
    }
    
    func configureImageView() {
        tableImageView.backgroundColor = .init(red: 0.81, green: 0.76, blue: 1.00, alpha: 0.50)
        
        tableImageView.layer.cornerRadius = 40
        tableImageView.layer.borderWidth = 2
        tableImageView.layer.borderColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        tableImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        tableHeadTitleLabel.textColor = .black
        tableTailTitleLabel.textColor = .gray
        tableHeadTitleLabel.numberOfLines = 0
        tableTailTitleLabel.numberOfLines = 0
    }
    
    func setImageConstraints() {
        tableImageView.translatesAutoresizingMaskIntoConstraints = false
        tableImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tableImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        tableImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        tableImageView.widthAnchor.constraint(equalTo: tableImageView.heightAnchor).isActive = true
    }
    
    func setHeadTitleLabelConstraints() {
          tableHeadTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableHeadTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        tableHeadTitleLabel.leadingAnchor.constraint(equalTo: tableImageView.trailingAnchor, constant: 20).isActive = true
              tableHeadTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tableHeadTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    func setTailTitleLabelConstraint() {
        tableTailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableTailTitleLabel.topAnchor.constraint(equalTo: tableHeadTitleLabel.bottomAnchor, constant: 12).isActive = true
        tableTailTitleLabel.leadingAnchor.constraint(equalTo: tableImageView.trailingAnchor, constant: 20).isActive = true
        tableTailTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tableTailTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}



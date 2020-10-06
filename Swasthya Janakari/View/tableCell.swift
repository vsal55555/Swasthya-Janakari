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
        tableHeadTitleLabel.text = cellinfo.title
        tableTailTitleLabel.text = cellinfo.topic
    }
    
    func configureImageView() {
        tableImageView.layer.cornerRadius = 10
        tableImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        tableHeadTitleLabel.backgroundColor = .green
        tableTailTitleLabel.backgroundColor = .systemPink
        tableHeadTitleLabel.numberOfLines = 0
        tableTailTitleLabel.numberOfLines = 0
    }
    
    func setImageConstraints() {
        tableImageView.translatesAutoresizingMaskIntoConstraints = false
        tableImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tableImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        tableImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        tableImageView.widthAnchor.constraint(equalTo: tableImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setHeadTitleLabelConstraints() {
          tableHeadTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableHeadTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableHeadTitleLabel.leadingAnchor.constraint(equalTo: tableImageView.trailingAnchor, constant: 20).isActive = true
              tableHeadTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tableHeadTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    func setTailTitleLabelConstraint() {
        tableTailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableTailTitleLabel.topAnchor.constraint(equalTo: tableHeadTitleLabel.bottomAnchor, constant: 20).isActive = true
        tableTailTitleLabel.leadingAnchor.constraint(equalTo: tableImageView.trailingAnchor, constant: 20).isActive = true
        tableTailTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tableTailTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}



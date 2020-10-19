//
//  phoneCell.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/7/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class phoneCell: UITableViewCell {
    
    
    var tableTitleLabel = UILabel()
    var tableHeadTitleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(tableTitleLabel)
        addSubview(tableHeadTitleLabel)
        
        
        
        configureTitleLabel()
        setTitleLabelConstraints()
        setHeadTitleLabelConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(phoneinfo: phoneInfo) {
        //let urlString = newsinfo.image
        //let url = URL(string: urlString)
        tableTitleLabel.text = phoneinfo.title
        tableHeadTitleLabel.text = phoneinfo.contact
    }
    
    
    func configureTitleLabel() {
        tableTitleLabel.backgroundColor = .systemPink
        tableHeadTitleLabel.backgroundColor = .green
       
        tableTitleLabel.numberOfLines = 0
        tableHeadTitleLabel.numberOfLines = 0
    }
    
    func setTitleLabelConstraints() {
        tableTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        tableTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tableTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setHeadTitleLabelConstraints() {
          tableHeadTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableHeadTitleLabel.topAnchor.constraint(equalTo: tableTitleLabel.bottomAnchor, constant: 20).isActive = true
        tableHeadTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
              tableHeadTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tableHeadTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}

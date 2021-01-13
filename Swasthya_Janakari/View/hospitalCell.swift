//
//  hospitalCell.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/5/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class hospitalCell: UITableViewCell {
    
    
    var tableTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.sizeToFit()
        return label
        
    }()
    var tableHeadTitleLabel = UILabel()
    var tableTailTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(tableTitleLabel)
        addSubview(tableHeadTitleLabel)
        addSubview(tableTailTitleLabel)
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("phoneLabelTapped"))
        tableTailTitleLabel.addGestureRecognizer(tap)
        
        configureTitleLabel()
        setTitleLabelConstraints()
        setHeadTitleLabelConstraints()
        setTailTitleLabelConstraint()
    }
    
    func phoneLabelTapped(sender: UITapGestureRecognizer) {
        print(tableTailTitleLabel.text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(hospitalinfo: hospitalInfo) {
        //let urlString = newsinfo.image
        //let url = URL(string: urlString)
        tableTitleLabel.text = hospitalinfo.title
        tableHeadTitleLabel.text = hospitalinfo.address
        tableTailTitleLabel.text = (hospitalinfo.brief == "") ? "N/A" : hospitalinfo.brief
        print("*********\(hospitalinfo.brief)***********")
    }
    
    
    
        
   
    func configureTitleLabel() {
       // tableTitleLabel.backgroundColor = .systemPink
       // tableHeadTitleLabel.backgroundColor = .green
        //tableTailTitleLabel.backgroundColor = .red
        //tableTitleLabel.numberOfLines = 0
        tableHeadTitleLabel.numberOfLines = 0
        tableTailTitleLabel.numberOfLines = 0
    }
    
    func setTitleLabelConstraints() {
        tableTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 08).isActive = true
        tableTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        //tableTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tableTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setHeadTitleLabelConstraints() {
          tableHeadTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableHeadTitleLabel.topAnchor.constraint(equalTo: tableTitleLabel.bottomAnchor, constant: 10).isActive = true
        tableHeadTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
              tableHeadTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tableHeadTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    func setTailTitleLabelConstraint() {
        tableTailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableTailTitleLabel.topAnchor.constraint(equalTo: tableHeadTitleLabel.bottomAnchor, constant: 10).isActive = true
        tableTailTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        tableTailTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tableTailTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
      //  tableTailTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
  
}

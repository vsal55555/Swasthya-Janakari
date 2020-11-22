//
//  symptomCell.swift
//  Swasthya_Janakari
//
//  Created by macbook on 11/19/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class symptomCell: UITableViewCell {

    
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
    
    func set(symptomZeroCellVCmodel: symptomZeroCellVCModel) {
        //let urlString = newsinfo.image
        //let url = URL(string: urlString)
        let urlString = symptomZeroCellVCmodel.image
        let url = URL(string: urlString)
        tableImageView.downloaded(from: url!)
        tableHeadTitleLabel.text = symptomZeroCellVCmodel.title
       // let test = String(text.filter { !" \n\t\r".contains($0) })
        tableTailTitleLabel.text = String(symptomZeroCellVCmodel.brief.filter { !"<pre></pre>".contains($0) })//symptomZeroCellVCmodel.brief
    }
    
    func configureImageView() {
        tableImageView.layer.cornerRadius = 10
        tableImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
       // tableTitleLabel.backgroundColor = .systemPink
       // tableHeadTitleLabel.backgroundColor = .green
        //tableTailTitleLabel.backgroundColor = .red
        tableHeadTitleLabel.numberOfLines = 0
        tableTailTitleLabel.numberOfLines = 0
    }
    
    func setImageConstraints() {
        tableImageView.translatesAutoresizingMaskIntoConstraints = false
        tableImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        tableImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -46).isActive = true
        //tableImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
         //tableImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
         tableImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        //tableTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setHeadTitleLabelConstraints() {
          tableHeadTitleLabel.translatesAutoresizingMaskIntoConstraints = false
          tableHeadTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
          tableHeadTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width/2).isActive = true
       // tableHeadTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //tableHeadTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    func setTailTitleLabelConstraint() {
        tableTailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableTailTitleLabel.topAnchor.constraint(equalTo: tableHeadTitleLabel.bottomAnchor, constant: -20).isActive = true
        tableTailTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width/2).isActive = true
        //tableTailTitleLabel.widthAnchor.constraint(equalToConstant: frame.width/2).isActive = true
        tableTailTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -08).isActive = true
        tableTailTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }

}




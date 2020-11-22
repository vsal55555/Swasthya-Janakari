//
//  SearchDistrictTableCell.swift
//  Swasthya_Janakari
//
//  Created by macbook on 11/13/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import Foundation
import UIKit

class SearchDistrictTableCell:  UITableViewCell {
    
    
    var fixedUpperDistrictTitleLabel = UILabel()
    var lowerDistrictTitleLabel = UILabel()
    
    var fixedUpperInfectedTitleLabel = UILabel()
    var lowerInfectedTitleLabel = UILabel()
    
    var fixedUpperRecoveredTitleLabel = UILabel()
    var lowerRecoveredTitleLabel = UILabel()
    
    var fixedUpperDiedTitleLabel = UILabel()
    var lowerDiedTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(fixedUpperDistrictTitleLabel)
        addSubview(lowerDistrictTitleLabel)
        
        addSubview(fixedUpperInfectedTitleLabel)
        addSubview(lowerInfectedTitleLabel)
        
        addSubview(fixedUpperRecoveredTitleLabel)
        addSubview(lowerRecoveredTitleLabel)
        
        addSubview(fixedUpperDiedTitleLabel)
        addSubview(lowerDiedTitleLabel)
        
        configureTitleLabel()
        setDistrictTitleLabelConstraints()
        setInfectedTitleLabelConstraints()
        setRecoveredTitleLabelConstraints()
        setDiedTitleLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(districtdata: SearchDistrictModel) {
      
        fixedUpperDistrictTitleLabel.text = "District"
        lowerDistrictTitleLabel.text = districtdata.title_np
        
               
        fixedUpperInfectedTitleLabel.text = "Infected"
        fixedUpperInfectedTitleLabel.textColor = .orange
        lowerInfectedTitleLabel.text = districtdata.male
        lowerInfectedTitleLabel.textColor = .orange
               
        fixedUpperRecoveredTitleLabel.text = "Recoverd"
        fixedUpperRecoveredTitleLabel.textColor = .green
        lowerRecoveredTitleLabel.text = districtdata.recover
        lowerRecoveredTitleLabel.textColor = .green
               
        fixedUpperDiedTitleLabel.text = "Dead"
        fixedUpperDiedTitleLabel.textColor = .red
        lowerDiedTitleLabel.text = districtdata.death
        lowerDiedTitleLabel.textColor = .red
    }
    
    
    func configureTitleLabel() {
        lowerDistrictTitleLabel.numberOfLines = 0
        lowerInfectedTitleLabel.numberOfLines = 0
        lowerRecoveredTitleLabel.numberOfLines = 0
        lowerDiedTitleLabel.numberOfLines = 0
    }
    
    func setDistrictTitleLabelConstraints() {
        fixedUpperDistrictTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        fixedUpperDistrictTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 04).isActive = true
        fixedUpperDistrictTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        fixedUpperDistrictTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lowerDistrictTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        lowerDistrictTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        lowerDistrictTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
       // lowerDistrictTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        lowerDistrictTitleLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setInfectedTitleLabelConstraints() {
        fixedUpperInfectedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        fixedUpperInfectedTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 04).isActive = true
        fixedUpperInfectedTitleLabel.leadingAnchor.constraint(equalTo: fixedUpperDistrictTitleLabel.trailingAnchor, constant: -38).isActive = true
        fixedUpperInfectedTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fixedUpperInfectedTitleLabel.trailingAnchor.constraint(equalTo: fixedUpperRecoveredTitleLabel.leadingAnchor, constant: -38).isActive = true
        
        lowerInfectedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        lowerInfectedTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        lowerInfectedTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150).isActive = true
        lowerInfectedTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
       
    }
    func setRecoveredTitleLabelConstraints() {
        fixedUpperRecoveredTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        fixedUpperRecoveredTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 04).isActive = true
        fixedUpperRecoveredTitleLabel.leadingAnchor.constraint(equalTo: fixedUpperInfectedTitleLabel.trailingAnchor, constant: -38).isActive = true
        fixedUpperRecoveredTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fixedUpperRecoveredTitleLabel.trailingAnchor.constraint(equalTo: fixedUpperDiedTitleLabel.leadingAnchor, constant: -38).isActive = true
        
        lowerRecoveredTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        lowerRecoveredTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        lowerRecoveredTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 246).isActive = true
        lowerRecoveredTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
       
    }
    func setDiedTitleLabelConstraint() {
        fixedUpperDiedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        fixedUpperDiedTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 04).isActive = true
        fixedUpperDiedTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        fixedUpperDiedTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lowerDiedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        lowerDiedTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        lowerDiedTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 346).isActive = true
        lowerDiedTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}




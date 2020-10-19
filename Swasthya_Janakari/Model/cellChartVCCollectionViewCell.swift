//
//  cellChartVCCollectionViewCell.swift
//  PokedexMVC
//
//  Created by macbook on 10/2/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class cellChartVCCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cellChartVCCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "cellChartVCCollectionViewCell", bundle: nil)
    }
    
    let LowerLabel : UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.lightGray
        lb.font = UIFont.systemFont(ofSize: 22)
        lb.font = UIFont.boldSystemFont(ofSize: 22)
        
     
        return lb
    }()
    
    let UpperLabel : UILabel = {
           let lb = UILabel()
           lb.textColor = UIColor.lightGray
           lb.font = UIFont.systemFont(ofSize: 22)
           lb.font = UIFont.boldSystemFont(ofSize: 22)
          
        
           return lb
       }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .link
        addSubview(UpperLabel)
        addSubview(LowerLabel)
        getdata()
        LowerLabel.translatesAutoresizingMaskIntoConstraints = false
        //emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        LowerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        LowerLabel.anchors(top: UpperLabel.bottomAnchor, topPad: 10, bottom: bottomAnchor, bottomPad: 10, left: nil, leftPad: 0, right: nil, rightPad: 0, height: 10, width: 0)
        //TitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        //TitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        
        UpperLabel.translatesAutoresizingMaskIntoConstraints = false
        //emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        UpperLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        UpperLabel.anchors(top: topAnchor, topPad: 18, bottom: nil, bottomPad: 0, left: nil, leftPad: 0, right: nil, rightPad: 0, height: 10, width: 0)
    }
    func getdata() {
        
    }

}

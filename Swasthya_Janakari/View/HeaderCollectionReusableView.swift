//
//  HeaderCollectionReusableView.swift
//  PokedexMVC
//
//  Created by macbook on 10/6/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "HeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "खमवदवमलवलवख"
       // label.textAlignment = .center
        label.textColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
        return label
    }()
    
  

    
    
    public func configure() {
        backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.anchors(top: nil, topPad: 0, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 16, right: rightAnchor, rightPad: 16, height: 0, width: 0)
    }
    //MARK: -OVERRIDE THE PARENT SUBVIEWS
    override func layoutSubviews() {
        super.layoutSubviews()
        //label.frame = bounds //entire screen
    }
    
 
    
}

class FooterCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "FooterCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "खमपिजषउमाजषउाफ"
        label.textAlignment = .center
        label.textColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
        return label
    }()
    
    public func configure() {
        backgroundColor = .systemRed
        addSubview(label)
    }
    //Mark: -OVERRIDE THE SUBVIEWS
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds //entire screen
    }
 
    
}

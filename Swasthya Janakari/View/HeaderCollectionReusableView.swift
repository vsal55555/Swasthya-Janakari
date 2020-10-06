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
        label.text = "header"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    public func configure() {
        backgroundColor = .systemGreen
        addSubview(label)
    }
    //Mark: -OVERRIDE THE SUBVIEWS
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds //entire screen
    }
 
    
}

class FooterCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "FooterCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "footer"
        label.textAlignment = .center
        label.textColor = .white
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

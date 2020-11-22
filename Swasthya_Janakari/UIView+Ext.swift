//
//  UIView+Ext.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/2/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

extension UIView {
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 16).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -16).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

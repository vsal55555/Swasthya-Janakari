//
//  ChartVCButtonHeader.swift
//  Swasthya_Janakari
//
//  Created by macbook on 11/15/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class ChartVCButtonHeader: UICollectionReusableView {
    
    //MARK: = BUTTON PROPERTIES
    
    
    let arrowLabel: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(systemName: "arrow.right")
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    let SearchButton: UIButton = {
               let button = UIButton(type: .system)
        button.backgroundColor = .init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
               button.layer.cornerRadius = 10
               let font = UIFont.systemFont(ofSize: 16)
               let attributedTitle = NSMutableAttributedString(string:
               "Search by District", attributes: [NSAttributedString.Key.foregroundColor:
                   UIColor.black, NSAttributedString.Key.font : font ])
               button.addTarget(self, action: #selector(button3SignIn), for: .touchUpInside)
               button.setAttributedTitle(attributedTitle, for: .normal)
               return button
        }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        addSubview(SearchButton)
               //SearchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               SearchButton.anchors(top: topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 0, right: nil, rightPad: 0, height: 50, width: 0)
               
        addSubview(arrowLabel)
               arrowLabel.anchors(top: topAnchor, topPad: 12, bottom: nil, bottomPad: 0, left: SearchButton.rightAnchor, leftPad: 16, right: rightAnchor, rightPad: 04, height: 30, width: 30)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func button3SignIn(){
             print("clicked me")
      }
}

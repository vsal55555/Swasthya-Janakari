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
    var completion: (() -> Void)?
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "खमवदवमलवलवख"
       // label.textAlignment = .center
        label.textColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
        return label
    }()
    
    let chartButton: UIButton = {
                  let button = UIButton(type: .system)
                  button.backgroundColor = .init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
                  button.layer.cornerRadius = 2
                  let font = UIFont.systemFont(ofSize: 18)
                  let attributedTitle = NSMutableAttributedString(string:
                  "Go to District Sreach", attributes: [NSAttributedString.Key.foregroundColor:
                      UIColor.black, NSAttributedString.Key.font : font ])
                  button.addTarget(self, action: #selector(button3SignIn), for: .touchUpInside)
                  button.setAttributedTitle(attributedTitle, for: .normal)
                  return button
           }()

    public func configure() {
        backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        addSubview(chartButton)
        chartButton.translatesAutoresizingMaskIntoConstraints = false
        chartButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        chartButton.anchors(top: topAnchor, topPad: 08, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 08, right: rightAnchor, rightPad: 08, height: 58, width: 0)
        
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.anchors(top: topAnchor, topPad: 82, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 16, right: rightAnchor, rightPad: 16, height: 10, width: 0)
    }
    //MARK: -OVERRIDE THE PARENT SUBVIEWS
    override func layoutSubviews() {
        super.layoutSubviews()
        //label.frame = bounds //entire screen
    }
    @objc func button3SignIn(){
            completion?()
           print("clicked me")
       }
 
    
}

class HeaderCollectionReusableView2: UICollectionReusableView {
        
    static let identifier = "HeaderCollectionReusableView2"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "खमवदवख"
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

class HeaderCollectionReusableView3: UICollectionReusableView {
        
    static let identifier = "HeaderCollectionReusableView3"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "खम"
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

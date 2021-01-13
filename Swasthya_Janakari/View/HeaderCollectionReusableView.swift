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
        label.text = "नेपालको पछिल्लो २४ घन्टाको तथ्याङ्क"
       // label.textAlignment = .center
        label.textColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
        return label
    }()
    
    let chartButton: UIButton = {
                  let button = UIButton(type: .system)
                  button.backgroundColor = .init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
                  button.layer.cornerRadius = 2
                  //let font = UIFont.systemFont(ofSize: 13)
                  //let attributedTitle = NSMutableAttributedString(string:
                 // "कुन जिल्ला कति सङ्‌कमित छन्? थाहा \n पाउन यहाँ क्लिक गर्नुहोस्", attributes: [NSAttributedString.Key.foregroundColor:
                    //  UIColor.black, NSAttributedString.Key.font : font ])
                  button.addTarget(self, action: #selector(button3SignIn), for: .touchUpInside)
                  //button.setAttributedTitle(attributedTitle, for: .normal)
                   button.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
                  return button
           }()
    
    let buttonLabel: UILabel = {
         let label = UILabel()
         label.numberOfLines = 2
        label.textColor = .black
         label.text = "कुन जिल्ला कति सङ्‌कमित छन्? थाहा पाउन यहाँ क्लिक गर्नुहोस्"
         label.textAlignment = .left
         return label
     }()
    
    let arrowLabel: UIImageView = {
          let v = UIImageView()
        v.tintColor = .black
          v.image = UIImage(systemName: "arrow.right")
          v.contentMode = .scaleAspectFill
          return v
      }()
      
    public func configure() {
        backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        addSubview(chartButton)
        chartButton.translatesAutoresizingMaskIntoConstraints = false
        chartButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        chartButton.anchors(top: topAnchor, topPad: 08, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 08, right: rightAnchor, rightPad: 08, height: 58, width: 0)
        
        
        
        addSubview(buttonLabel)
        buttonLabel.anchors(top: topAnchor, topPad: 12, bottom: nil, bottomPad: 0, left: chartButton.leftAnchor, leftPad: 16, right: nil, rightPad: 0, height: 0, width: frame.width*0.7)
        
        addSubview(arrowLabel)
        arrowLabel.anchors(top: topAnchor, topPad: 16, bottom: nil, bottomPad: 0, left: nil, leftPad: 0, right: chartButton.rightAnchor, rightPad: 08, height: 30, width: 30)
        
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
        label.text = "नेपालको हालसम्मको तथ्याङ्क"
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
        label.text = "विश्भरीको तथ्याङ्क"
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

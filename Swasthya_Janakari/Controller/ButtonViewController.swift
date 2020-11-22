//
//  ButtonViewController.swift
//  Swasthya_Janakari
//
//  Created by macbook on 11/15/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.

import UIKit

class ButtonViewController: UICollectionViewController {
    
    
    /*
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
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        collectionView.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        view.addSubview(containerView)
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 1
     //   containerView.anchors(top: view.topAnchor, topPad: 8, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 8, right: view.rightAnchor, rightPad: 8, height: 50, width: 0)
        containerView.homeAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 08, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 150, height: 50)
        containerView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
 */
        
    }
    
    @objc func button3SignIn(){
           print("clicked me")
    }

}

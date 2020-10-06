//
//  chartVC.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/8/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit
import SwiftMessages
//private let reuseIdentifier = "cellChartVCCollectionViewCell" //minimize the possibility of human error


class chartVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let reachability = Reachability()
    
    
    //Mark: - properties
    //Mark: - Init
 //   @IBOutlet weak var imageView: UIImageView!
   // @IBOutlet weak var nameLabel: UILabel!
    
    //var collectionArr: [String] = ["1", "2", "3", "4", "5"]
    let cellTitle = [("Bishal"), ("Puja"), ("Hari")]
    let cellImage = [UIImage(named: "dice_1"), UIImage(named: "dice_2"), UIImage(named: "dice_3")]
    
    //Mark: Tabbar Controller
    
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
       // layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.scrollDirection = .vertical
        
        
        //layout.itemSize = CGSize(width: view .frame.width/2.2, height: view.frame.size.width/2.2)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView?.register(cellChartVCCollectionViewCell.nib(), forCellWithReuseIdentifier: cellChartVCCollectionViewCell.identifier)
        
        collectionView?.register(smallCellChartVCCollectionViewCell.nib(), forCellWithReuseIdentifier: smallCellChartVCCollectionViewCell.identifier)
        
        //HeaderCollectionReusableView
        collectionView?.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
        //FooterCollectionReusableView
        collectionView?.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        view.addSubview(collectionView!)
      //  configureViewComponents()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        
           do {
               try reachability?.startNotifier()
           } catch let error {
               print(error)
           }
           handleReachability()
       }
       
       fileprivate func handleReachability() {
           NotificationCenter.default.addObserver(forName: .reachabilityChanged, object: reachability, queue: .main) { (notification) in
               if let MyRechability = notification.object as? Reachability {
                   switch MyRechability.connection {
                   case .cellular:
                       self.displayMessage(message: "Connected by cellular data", messageError: false)
                   case .wifi:
                       self.displayMessage(message: "Connected by Wifi", messageError: false)
                   case .none:
                       self.displayMessage(message: "No Internet Connection", messageError: true)
                   }
               }
           }
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           reachability?.stopNotifier()
           NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
       }
       
       func displayMessage(message: String, messageError: Bool) {
           
           let view = MessageView.viewFromNib(layout: MessageView.Layout.messageView)
           if messageError == true {
               view.configureTheme(.error)
           } else {
               view.configureTheme(.success)
           }
           
           view.iconImageView?.isHidden = true
           view.iconLabel?.isHidden = true
           view.titleLabel?.isHidden = true
           view.bodyLabel?.text = message
           view.titleLabel?.textColor = UIColor.white
           view.bodyLabel?.textColor = UIColor.white
           view.button?.isHidden = true
           
           var config = SwiftMessages.Config()
           config.presentationStyle = .bottom
           SwiftMessages.show(config: config, view: view)
       }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
        }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        if section == 1 {
            return 4
        }
        return 4
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: smallCellChartVCCollectionViewCell.identifier, for: indexPath) //as cellChartVCCollectionViewCell?
            cell.clipsToBounds = true
            cell.layer.cornerRadius = 15
            return cell
            
        }
        if indexPath.section == 1 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellChartVCCollectionViewCell.identifier, for: indexPath) //as cellChartVCCollectionViewCell?
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 15
        return cell
     }
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellChartVCCollectionViewCell.identifier, for: indexPath) //as cellChartVCCollectionViewCell?
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 15
        return cell
        
    }
    
    
    //MARK: -DEQUEUE THE HEADER AND PROVIDE SIZE FOR THE HEADER
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //MARK: - way to check in what section you are getting the header/ footer or dequening
        //first section
        
        
   /*     //MARK: -Footer COLECTIONRESUABLEVIEW
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath) as! FooterCollectionReusableView
            
            footer.configure()
            return footer
            
        }  */
        //MARK: -HEADER COLECTIONRESUABLEVIEW
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        
        header.configure()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
         return CGSize(width: view.frame.size.width, height: 200)
    }
    */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
           return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        if section == 1 {
                  return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
               }
        return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: (view.frame.width/3) - 16, height: 100)
        }
        if indexPath.section == 1 {
            return  CGSize(width: view .frame.width/2.2, height: view.frame.size.width/4.4)
        }
        return  CGSize(width: view .frame.width/2.2, height: view.frame.size.width/4.4)
    }
}
    



    //Mark: - Selectors
   // @objc func showSearchBar() {
     //   print(123)}
    /*
    //Mark: - Helper Functions
    func configureViewComponents() {
        //collectionView.backgroundColor = .white
       
        
       // navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        //navigationItem.rightBarButtonItem?.tintColor = .white
      //  collectionView.register(Cell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
*/
/*
extension chartVC: UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 32, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 36)
        return CGSize(width: width, height: width/2 )
    }
}
*/

//
//  chartVC.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/8/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit
import SwiftMessages   //package provides the reachability class for internet connectivity
//private let reuseIdentifier = "cellChartVCCollectionViewCell" //minimize the possibility of human error


class chartVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //MARK: - REACHABILITY CLASS OBJECT
    let reachability = Reachability()
    
    
    //Mark: - properties
    //Mark: - Init
 //   @IBOutlet weak var imageView: UIImageView!
   // @IBOutlet weak var nameLabel: UILabel!
    
    //var collectionArr: [String] = ["1", "2", "3", "4", "5"]
    let cellTitle = [("Bishal"), ("Puja"), ("Hari")]
    let cellImage = [UIImage(named: "dice_1"), UIImage(named: "dice_2"), UIImage(named: "dice_3")]
    let myUpperLabelcolorforsmallCell = [UIColor.orange, UIColor.green, UIColor.red]
    let myUpperLabelcolorforCell =  [.init(red: 1.00, green: 0.83, blue: 0.16, alpha: 1.00), UIColor.orange, UIColor.green, UIColor.red]
    
    var upperTitle: [upperTitleCell] = []
    var myArrayforUpperTitle = [String]()
    let lowerTitle = ["Tested", "Deaths", "Recovered"]
    
    var upperSquareTitle: [upperSquareTitleCell] = []
    var myArrayforUpperSquareTitle = [String]()
    let upperTitleSquare = ["Tested", "Deaths", "Recovered", "Infected"]
    
    var lowerSquareTitle: [lowerSquareTitleCell] = []
    var myArrayforlowerSquareTitle = [String]()
    let lowerTitleSquare = ["Tested", "Deaths", "Recovered", "Infected"]
    
    //Mark: Tabbar Controller
    var myArrayfornumberupperTitleLabel1: String = ""
    var collectionView: UICollectionView?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.scrollDirection = .vertical
        
        print("i'm in charVC\(appDelegate.myArrayfornumberupperTitleLabel1)")
        myArrayforUpperTitle = appDelegate.myArrayforUpperTitle
        myArrayforUpperSquareTitle = appDelegate.myArrayforUpperSquareTitle
        myArrayforlowerSquareTitle = appDelegate.myArrayforlowerSquareTitle
        /*
        getData(completed: { data in
          
            
            self.myArrayforUpperTitle.append(data[0].karnali_death)
            self.myArrayforUpperTitle.append(data[0].karnali_recovered)
            self.myArrayforUpperTitle.append(data[0].karnali_tested)
          
           
        })  */
        
        //layout.itemSize = CGSize(width: view .frame.width/2.2, height: view.frame.size.width/2.2)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView?.register(cellChartVCCollectionViewCell.nib(), forCellWithReuseIdentifier: cellChartVCCollectionViewCell.identifier)
        
        collectionView?.register(smallCellChartVCCollectionViewCell.nib(), forCellWithReuseIdentifier: smallCellChartVCCollectionViewCell.identifier)
        
        //HeaderCollectionReusableView
        collectionView?.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView?.register(HeaderCollectionReusableView2.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView2.identifier)
        collectionView?.register(HeaderCollectionReusableView3.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView3.identifier)
        
        //FooterCollectionReusableView
        collectionView?.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        view.addSubview(collectionView!)
      //  configureViewComponents()
       
    }
    /*
    func getData(completed: @escaping ([upperTitleCell]) -> ()) {
            print("*****************task is starting******************")
            let url = URL(string: "http://covid.hostingofprologic.com/api/statics/listby")
            
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error == nil {
                    //var result = [upperTitleCell]()
                    do {
                        self.upperTitle = try JSONDecoder().decode([upperTitleCell].self, from: data!)
                        DispatchQueue.main.async {
                            completed(self.upperTitle)
                        }
                    } catch {
                            print("Json Error")
                    }
                }
            }.resume()
            print("*****************task ended******************")
        }  */

    
     //MARK: - REACHABILITY CLASS CHECKS FOR INTERNET CONNECTIVITY WHEN VIEWWILLAPPEAR AND RESUME APP WHEN IT'S SWITCH FROM OFFLINE TO ONLINE
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        
           do {
               try reachability?.startNotifier()
           } catch let error {
               print(error)
           }
           handleReachability()
       }
       
    //MARK: -  REACHABILITY CLASS METHODS 
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
       
    //MARK: -  REACHABILITY CLASS METHODS HELPS TO RESUME APP WHEN IT'S SWITCH FROM OFFLINE TO ONLINE
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: smallCellChartVCCollectionViewCell.identifier, for: indexPath) as! smallCellChartVCCollectionViewCell
            cell.LowerLabel.text = lowerTitle[indexPath.row]
            cell.UpperLabel.text = myArrayforUpperTitle[indexPath.row]
            cell.UpperLabel.textColor = myUpperLabelcolorforsmallCell[indexPath.row]
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 3)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 0.35
            cell.clipsToBounds = true
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = false
//cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath

            //addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
            return cell
        }
        
        if indexPath.section == 1 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellChartVCCollectionViewCell.identifier, for: indexPath) as! cellChartVCCollectionViewCell
            cell.LowerLabel.text = upperTitleSquare[indexPath.row]
            cell.UpperLabel.text = myArrayforUpperSquareTitle[indexPath.row]
            cell.UpperLabel.textColor = myUpperLabelcolorforCell[indexPath.row]
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 3)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 0.35
            cell.clipsToBounds = true
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = false
        return cell
     }
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellChartVCCollectionViewCell.identifier, for: indexPath) as! cellChartVCCollectionViewCell
        cell.LowerLabel.text = lowerTitleSquare[indexPath.row]
        cell.UpperLabel.text = myArrayforlowerSquareTitle[indexPath.row]
        cell.UpperLabel.textColor = myUpperLabelcolorforCell[indexPath.row]
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.35
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = false
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
        
        
        if indexPath.section == 0 {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        
        header.configure()
            header.completion = {
                let vc = SearchDistrictVC()
                self.navigationController?.pushViewController(vc, animated: true)
                let loader =   self.loader()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.stopLoader(loader: loader)
                }
            }
        return header
        }
        if indexPath.section == 1 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView2.identifier, for: indexPath) as! HeaderCollectionReusableView2
            
            header.configure()
            return header
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView3.identifier, for: indexPath) as! HeaderCollectionReusableView3
        
        header.configure()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: view.frame.size.width, height: 64)
        }
        
        return CGSize(width: view.frame.size.width, height: 40)
    }
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
         return CGSize(width: view.frame.size.width, height: 200)
    }
    */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
           //return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
           return UIEdgeInsets(top: 54, left: 8, bottom: 10, right: 8)
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
    



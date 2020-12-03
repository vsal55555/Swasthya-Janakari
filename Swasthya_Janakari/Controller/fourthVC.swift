//
//  fourthVC.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/1/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit
import SwiftMessages   //package provides the reachability class for internet connectivity

class fourthVC: UIViewController {
    
    //MARK: - REACHABILITY CLASS OBJECT
    let reachability = Reachability()
    var tableview = UITableView()
    var cellInfos: [cellInfo] = []
    let cellSpacingHeight: CGFloat = 20
    
    let zerotableVC = zeroCellVC()
    let firsttableVC = firstCellVC()
    let secondtableVC = secondCellVC()
    
    struct Cells {
        static let tablecell = "tableCell"
    }

    override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
    cellInfos = fetchData()
    configureTableView()
        
}
    
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
    
    
    func configureTableView(){
        view.addSubview(tableview)
        tableview.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        setTableViewdelegates()
        tableview.rowHeight = 100
        tableview.register(tableCell.self, forCellReuseIdentifier: "tableCell")
        tableview.pin(to: view)
    }
    
    func setTableViewdelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
}
//how many cells do tableview need
extension fourthVC: UITableViewDelegate, UITableViewDataSource {
    
     func numberOfSections(in tableView: UITableView) -> Int {
           return cellInfos.count
       }
    //set the space between the sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    //there is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // var selectedIndex = 2
        /*
        switch indexPath.section {
        case 0:
            //print("i'm in \(indexPath.section)")
            self.navigationController?.pushViewController(zerotableVC, animated: true)
        case 1:
             //print("i'm in \(indexPath.section)")
            self.navigationController?.pushViewController(firsttableVC, animated: true)
        case 2:
             //print("i'm in \(indexPath.section)")
            var secondtableVC = secondCellVC()
            self.navigationController?.pushViewController(secondtableVC, animated: true)
        default:
            print("i'm in same view.")
        } */
        if (indexPath.section == 2) {
        self.navigationController?.pushViewController(secondtableVC, animated: true)
        }
        if (indexPath.section == 1) {
        self.navigationController?.pushViewController(firsttableVC, animated: true)
        }
        if (indexPath.section == 0) {
        self.navigationController?.pushViewController(zerotableVC, animated: true)
        }
        else {
            print("i'm in same view.")
        }
    }

    //what cell i'm putting in there
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: Cells.tablecell) as! tableCell
        
        
        cell.layer.cornerRadius = 10
        let shadowPath2 = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
        cell.layer.shadowOpacity = 0.8
        cell.layer.shadowPath = shadowPath2.cgPath
        
        let cellinfo = cellInfos[indexPath.section]
        cell.set(cellinfo: cellinfo)
        return cell
    }
    
    
}

extension fourthVC {
    func fetchData() -> [cellInfo] {
        let cell1 = cellInfo(image: Images.covid, title: "कोभिड-१९ सम्बन्धी जानकारी", topic: "लक्षणहरु, रोकथामका उपाय, उपचार")
        let cell2 = cellInfo(image: Images.notification, title: "नोटिफिकेशन", topic: "अत्यावश्यक सुचना, जानकारी मुलक सुचना")
        let cell3 = cellInfo(image: Images.number, title: "टेलिफोन नम्बरहरु", topic: "आपतकालिन वा अत्यावशेक टेलिफोन नम्बरहरु")
        
        return [cell1, cell2, cell3]
    }
    
}


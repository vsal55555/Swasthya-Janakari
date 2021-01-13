//
//  DoctorDetailVC.swift
//  Swasthya_Janakari
//
//  Created by macbook on 11/25/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit
import SwiftMessages

class DoctorVC: UIViewController {
    
    //MARK: - REACHABILITY CLASS OBJECT
    let reachability = Reachability()
    
    var tableview = UITableView()
    //var newsInfos: [newsInfo] = []
    let cellSpacingHeight: CGFloat = 20
    var doctorVCmodels = [doctorVCmodel]()

    struct Cells {
        static let tablecell = "DoctorsCell"
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        let loader =   self.loader()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.stopLoader(loader: loader)}
        
    // Do any additional setup after loading the view.
        getJSON {
            print("*****************i'm in reload******************")
            self.tableview.reloadData()
            print("*****************reload ended******************")
        }
    configureTableView()
}
     //MARK: - REACHABILITY CLASS CHECKS FOR INTERNET CONNECTIVITY WHEN VIEWWILLAPPEAR AND RESUME APP WHEN IT'S SWITCH FROM OFFLINE TO ONLINE
    override func viewWillAppear(_ animated: Bool) {
        
        
        super.viewWillAppear(animated)
      getJSON {
                     self.tableview.reloadData()
                 }
             configureTableView()
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
    
    func configureTableView() {
        view.addSubview(tableview)
        tableview.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        setTableViewdelegates()
        tableview.rowHeight = 180
        tableview.register(DoctorsCell.self, forCellReuseIdentifier: "DoctorsCell")
        tableview.pin(to: view)
    }
    
 
    
    func setTableViewdelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }

    func getJSON(completed: @escaping () -> ()) {
        print("*****************task is starting******************")
        let url = URL(string: "http://covid.hostingofprologic.com/api/doctor/listby")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.doctorVCmodels = try JSONDecoder().decode([doctorVCmodel].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                        print("Json Error")
                }
            }
        }.resume()
        print("*****************task ended******************")
    }
   
}

extension DoctorVC: UITableViewDelegate, UITableViewDataSource {
    
     func numberOfSections(in tableView: UITableView) -> Int {
              return doctorVCmodels.count
          }
       //set the space between the sections
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return cellSpacingHeight
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
       
              
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableview.dequeueReusableCell(withIdentifier: Cells.tablecell) as! DoctorsCell
        
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        let shadowPath2 = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(5.0), height: CGFloat(10.0))
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowPath = shadowPath2.cgPath
       
 
        let doctorVCmodel = doctorVCmodels[indexPath.section]
        cell.set(doctorVCmodel: doctorVCmodel)
        return cell
        
    }
 
    
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         //let selectedrow = self.news[indexPath.section]
         let vc = DoctorDetailVC()
         vc.doctorNameLabel.text = doctorVCmodels[indexPath.section].name
         vc.specialistLabel.text = doctorVCmodels[indexPath.section].specialist
         vc.emailLabel.text = doctorVCmodels[indexPath.section].email
         vc.phoneLabel.text = doctorVCmodels[indexPath.section].mobile
         vc.doctorBrief.text = doctorVCmodels[indexPath.section].brief
         vc.doctorsImageView.downloaded(from: URL(string: doctorVCmodels[indexPath.section].image)!)
         self.navigationController?.pushViewController(vc, animated: true)
     }

}


 

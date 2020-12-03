//
//  ViewController.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/1/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit
import SwiftMessages  //package provides the reachability class for internet connectivity


class secondVC: UIViewController {
    
    //MARK: - REACHABILITY CLASS OBJECT
    let reachability = Reachability()
    
    var tableview = UITableView()
      
        let cellSpacingHeight: CGFloat = 20
        var hospitals = [hospitalInfo]()
    
        struct Cells {
            static let tablecell = "hospitalCell"
        }
        //MARK: -UISEGMENTED CONTROL
    let items = ["पिसिआर केन्द्र", "क्वारेन्टाईन केन्द्र", "जेनेरल अस्पताल"]
       lazy var segmentedControl: UISegmentedControl = {
           let control = UISegmentedControl(items: items)
           control.selectedSegmentIndex = 0
           control.widthAnchor.constraint(equalToConstant: 380).isActive = true
           //control.backgroundColor = .mainPink()
           control.selectedSegmentTintColor = .mainPink()
           control.addTarget(self, action: #selector(handleSegmentedControlValueChanged(_:)), for: .valueChanged)
           return control
       }()
    


        override func viewDidLoad() {
        super.viewDidLoad()
            view.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
            
        navigationItem.titleView = segmentedControl
        configureTableView()
    }
    
    @objc fileprivate func handleSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
           // rowsToDisplay = pcr
            let loader =   self.loader()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stopLoader(loader: loader)
                   }
            getJSONforPCR{
                self.tableview.reloadData()
            }
            print("you are in PCR ")
            
        case 1:
            let loader =   self.loader()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stopLoader(loader: loader)
            }
            getJSONforQuarantine{
            self.tableview.reloadData()
                       }
          //  rowsToDisplay = quarantine
            print("you are in Quarantine ")
            //view.backgroundColor = .red
        case 2:
           // rowsToDisplay = general
            let loader =   self.loader()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stopLoader(loader: loader)
            }
            getJSONforGeneral{
                self.tableview.reloadData()
            }
            print("you are in General ")
            //view.backgroundColor = .green
        default:
         //   rowsToDisplay = pcr
            getJSONforPCR{
                self.tableview.reloadData()
            }
            print("you are in PCR")
           
        }
        //tableView.reloadData()
    }

    //MARK: - REACHABILITY CLASS CHECKS FOR INTERNET CONNECTIVITY WHEN VIEWWILLAPPEAR AND RESUME APP WHEN IT'S SWITCH FROM OFFLINE TO ONLINE
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        print("i'm in viewwillappear")
          let loader =   self.loader()
          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stopLoader(loader: loader)
        }
        getJSONforPCR {
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    print("i'm in viewdidappear")
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
           // view.addSubview(segmentedControl)
            //segmentedControl.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 04, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor, rightPad: 16, height: 30, width: 0)
            view.addSubview(tableview)
            tableview.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
            tableview.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 8, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor, rightPad: 16, height: view.bounds.height - 50, width: 0)
            setTableViewdelegates()
            tableview.rowHeight = 100
            tableview.register(hospitalCell.self, forCellReuseIdentifier: "hospitalCell")
            //tableview.pin(to: view)
        }
        
        func setTableViewdelegates() {
            tableview.delegate = self
            tableview.dataSource = self
        }

        func getJSONforPCR(completed: @escaping () -> ()) {
         //   let url = URL(string: "http://covid.hostingofprologic.com/api/hospital/listby")
        let url = URL(string: "http://covid.hostingofprologic.com/api/hospital/listby?typ=3&pgn=0&oby=ASC")
           
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error == nil {
                    do {
                        self.hospitals = try JSONDecoder().decode([hospitalInfo].self, from: data!)
                        DispatchQueue.main.async {
                            completed()
                        }
                    } catch {
                            print("Json Error")
                    }
                }
            }.resume()
        }
    
    func getJSONforQuarantine(completed: @escaping () -> ()) {
            let url = URL(string: "http://covid.hostingofprologic.com/api/hospital/listby?typ=2&pgn=0&oby=ASC")
            
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error == nil {
                    do {
                        self.hospitals = try JSONDecoder().decode([hospitalInfo].self, from: data!)
                        DispatchQueue.main.async {
                            completed()
                        }
                    } catch {
                            print("Json Error")
                    }
                }
            }.resume()
        }
    
    func getJSONforGeneral(completed: @escaping () -> ()) {
              let url = URL(string: "http://covid.hostingofprologic.com/api/hospital/listby?typ=1&pgn=0&oby=ASC")
              
              URLSession.shared.dataTask(with: url!) { (data, response, error) in
                  if error == nil {
                      do {
                          self.hospitals = try JSONDecoder().decode([hospitalInfo].self, from: data!)
                          DispatchQueue.main.async {
                              completed()
                          }
                      } catch {
                              print("Json Error")
                      }
                  }
              }.resume()
          }
    }

    extension secondVC: UITableViewDelegate, UITableViewDataSource {
        
         func numberOfSections(in tableView: UITableView) -> Int {
                  return hospitals.count
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
            
            let cell = tableview.dequeueReusableCell(withIdentifier: Cells.tablecell) as! hospitalCell

            cell.layer.cornerRadius = 2
            let shadowPath2 = UIBezierPath(rect: cell.bounds)
            cell.layer.masksToBounds = false
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
            cell.layer.shadowOpacity = 0.35
            cell.layer.shadowPath = shadowPath2.cgPath
            
            let hospitalinfo = hospitals[indexPath.section]
            cell.set(hospitalinfo: hospitalinfo)
            
            
                     
            return cell
            
        }
        
        
    }

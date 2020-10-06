//
//  phoneVC.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/6/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit
import SwiftMessages

class secondCellVC: UIViewController {
    let reachability = Reachability()
    
    var tableview = UITableView()
    var phones: [phoneInfo] = []
    let cellSpacingHeight: CGFloat = 10
    
    struct Cells {
            static let tablecell = "phoneCell"
        }
        
        override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        // Do any additional setup after loading the view.
            getJSON {
                self.tableview.reloadData()
            }
        configureTableView()
    }
    
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
    
    
        
        func configureTableView() {
            view.addSubview(tableview)
            setTableViewdelegates()
            tableview.rowHeight = 100
            tableview.register(phoneCell.self, forCellReuseIdentifier: "phoneCell")
            tableview.pin(to: view)
        }
        
        func setTableViewdelegates() {
            tableview.delegate = self
            tableview.dataSource = self
        }

        func getJSON(completed: @escaping () -> ()) {
            let url = URL(string: "http://covid.hostingofprologic.com/api/emergency/listby")
            
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error == nil {
                    do {
                        self.phones = try JSONDecoder().decode([phoneInfo].self, from: data!)
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

    extension secondCellVC: UITableViewDelegate, UITableViewDataSource {
        
         func numberOfSections(in tableView: UITableView) -> Int {
                  return phones.count
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
           
            //print(news)
            //print("\(news[0].title)")
            
            let cell = tableview.dequeueReusableCell(withIdentifier: Cells.tablecell) as! phoneCell
            cell.backgroundColor = .blue
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
            
            let phoneinfo = phones[indexPath.section]
            cell.set(phoneinfo: phoneinfo)
            
            
             
            return cell
            
        }
        
        
    }

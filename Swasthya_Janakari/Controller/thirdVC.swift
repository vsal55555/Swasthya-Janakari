//
//  thirdVC.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/1/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit
import SafariServices
import SwiftMessages   //package provides the reachability class for internet connectivity

class thirdVC: UIViewController {
    
    //MARK: - REACHABILITY CLASS OBJECT
    let reachability = Reachability()
    
    var tableview = UITableView()
    var newsInfos: [newsInfo] = []
    let cellSpacingHeight: CGFloat = 10
    var news = [newsInfo]()

    struct Cells {
        static let tablecell = "newsCell"
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemRed
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
        setTableViewdelegates()
        tableview.rowHeight = 100
        tableview.register(newsCell.self, forCellReuseIdentifier: "newsCell")
        tableview.pin(to: view)
    }
    
    func setTableViewdelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }

    func getJSON(completed: @escaping () -> ()) {
        print("*****************task is starting******************")
        let url = URL(string: "http://covid.hostingofprologic.com/api/news/listby")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.news = try JSONDecoder().decode([newsInfo].self, from: data!)
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

extension thirdVC: UITableViewDelegate, UITableViewDataSource {
    
     func numberOfSections(in tableView: UITableView) -> Int {
              return news.count
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
       
        
        let cell = tableview.dequeueReusableCell(withIdentifier: Cells.tablecell) as! newsCell
        cell.backgroundColor = .blue
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        let newsinfo = news[indexPath.section]
        cell.set(newsinfo: newsinfo)
    
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedrow = self.news[indexPath.section]
        let urlString = selectedrow.ext_link
        let url = try URL(string: urlString)
        let safariVC = SFSafariViewController(url: url!)
        safariVC.view.tintColor = .mainPink()
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
    
}


extension thirdVC: SFSafariViewControllerDelegate {
    
    //this gets call when webpage is cancelled
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

 

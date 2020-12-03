//
//  covidInfo.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/7/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit
import SwiftMessages

class zeroCellVC: UIViewController {
    
    //MARK: - REACHABILITY CLASS OBJECT
       let reachability = Reachability()
       
       var tableview = UITableView()
       var precautionTableView = UITableView()
    
           let cellSpacingHeight: CGFloat = 40
           var symptomZeroCellVCModels = [symptomZeroCellVCModel]()
           var precautionZeroCellVCModels = [precautionZeroCellVCModel]()
    
           struct Cells {
               static let tablecell = "symptomCell"
               static let precautionCell = "precautionCell"
           }
           //MARK: -UISEGMENTED CONTROL
       let items = ["लक्षणहरु", "रोकथामका उपाय", "उपचार"]  
          lazy var segmentedControl: UISegmentedControl = {
              let control = UISegmentedControl(items: items)
              control.selectedSegmentIndex = 0
              control.widthAnchor.constraint(equalToConstant: 340).isActive = true
              //control.backgroundColor = .mainPink()
              control.selectedSegmentTintColor = .mainPink()
              control.addTarget(self, action: #selector(handleSegmentedControlValueChanged(_:)), for: .valueChanged)
              return control
          }()
       
    lazy var containerView1: UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        view .addSubview(centralImage)
        centralImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centralImage.homeAnchor(top: view.topAnchor, paddingTop: 16, width: 100, height: 100)
        centralImage.layer.cornerRadius = 50
        
        view.addSubview(UpperTitleLabel)
        UpperTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        UpperTitleLabel.homeAnchor(top: centralImage.bottomAnchor, paddingTop: 16,  width: 350, height: 30)
        
        view.addSubview(LowerTitleLabel)
        LowerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        LowerTitleLabel.homeAnchor(top: UpperTitleLabel.bottomAnchor, paddingTop: 04,  width: 350, height: 30)

        view.addSubview(LowerTitleLabel2)
        LowerTitleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        LowerTitleLabel2.homeAnchor(top: LowerTitleLabel.bottomAnchor, paddingTop: 04,  width: 350, height: 30)
        
        view.addSubview(LowerTitleLabel3)
        LowerTitleLabel3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        LowerTitleLabel3.homeAnchor(top: LowerTitleLabel2.bottomAnchor, paddingTop: 04,  width: 350, height: 30)
        
        view.addSubview(LowerTitleLabel4)
        LowerTitleLabel4.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        LowerTitleLabel4.homeAnchor(top: LowerTitleLabel3.bottomAnchor, paddingTop: 04,  width: 350, height: 30)
        return view
    }()
    
    let centralImage: UIImageView = {
                let iv = UIImageView()
                iv.backgroundColor = .red
                iv.image = #imageLiteral(resourceName: "home-icon2")
                iv.contentMode = .scaleAspectFill
                iv.clipsToBounds = true
                return iv
            }()
    
    let UpperTitleLabel: UILabel = {
          let label = UILabel()
          label.textAlignment = .center
          label.text = "Call for the emergency"
          label.font = UIFont.boldSystemFont(ofSize: 17)
          label.textColor = .black
          return label
      }()
    
    let LowerTitleLabel: UILabel = {
             let label = UILabel()
             label.textAlignment = .left
             label.text = "This article is about the group of viruses"
             label.font = UIFont.systemFont(ofSize: 17)
             label.textColor = .black
             return label
         }()
    
    let LowerTitleLabel2: UILabel = {
                let label = UILabel()
                label.textAlignment = .left
                label.text = "For the disease involved in the ongoing"
                label.font = UIFont.systemFont(ofSize: 17)
                label.textColor = .black
                return label
            }()
    let LowerTitleLabel3: UILabel = {
                let label = UILabel()
                label.textAlignment = .left
                label.text = "pandemic, see Coronavirus disease 2019."
                label.font = UIFont.systemFont(ofSize: 17)
                label.textColor = .black
                return label
            }()
    let LowerTitleLabel4: UILabel = {
                let label = UILabel()
                label.textAlignment = .left
                label.text = "see Coronavirus disease 2019."
                label.font = UIFont.systemFont(ofSize: 17)
                label.textColor = .black
                return label
            }()
    
    let Button1: UIButton = {
               let button = UIButton(type: .system)
               button.backgroundColor = UIColor.mainPink()
               button.layer.cornerRadius = 10
               let font = UIFont.systemFont(ofSize: 16)
               let attributedTitle = NSMutableAttributedString(string:
               "9841255834", attributes: [NSAttributedString.Key.foregroundColor:
                   UIColor.white, NSAttributedString.Key.font : font ])
               button.addTarget(self, action: #selector(clickedButton1), for: .touchUpInside)
               button.setAttributedTitle(attributedTitle, for: .normal)
               return button
        }()
    
    let Button2: UIButton = {
               let button = UIButton(type: .system)
               button.backgroundColor = UIColor.mainPink()
               button.layer.cornerRadius = 10
               let font = UIFont.systemFont(ofSize: 16)
               let attributedTitle = NSMutableAttributedString(string:
               "9841255837", attributes: [NSAttributedString.Key.foregroundColor:
                   UIColor.white, NSAttributedString.Key.font : font ])
               button.addTarget(self, action: #selector(clickedButton2), for: .touchUpInside)
               button.setAttributedTitle(attributedTitle, for: .normal)
               return button
        }()
    
    let callLabel: UIImageView = {
          let v = UIImageView()
          v.image = UIImage(named: "call_icon")
          v.contentMode = .scaleAspectFill
          return v
      }()
    
    let callLabel2: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "call_icon")
        v.contentMode = .scaleAspectFill
        return v
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
                self.view.addSubview(self.tableview)
                self.self.tableview.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
                self.tableview.anchors(top: self.view.safeAreaLayoutGuide.topAnchor, topPad: 8, bottom: nil, bottomPad: 0, left: self.view.leftAnchor, leftPad: 16, right: self.view.rightAnchor, rightPad: 16, height: self.view.bounds.height - 50, width: 0)
                self.tableview.reloadData()
            }
            print("you are in Symptoms ")
            
        case 1:
            let loader =   self.loader()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stopLoader(loader: loader)
            }
            getJSONforPrecaution{
                self.view.addSubview(self.precautionTableView)
                self.precautionTableView.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
                self.precautionTableView.anchors(top: self.view.safeAreaLayoutGuide.topAnchor, topPad: 8, bottom: nil, bottomPad: 0, left: self.view.leftAnchor, leftPad: 16, right: self.view.rightAnchor, rightPad: 16, height: self.view.bounds.height - 50, width: 0)
                self.precautionTableView.reloadData()
                       }
          //  rowsToDisplay = quarantine
            print("you are in Precautions ")
            //view.backgroundColor = .red
        case 2:
           // rowsToDisplay = general
            let loader =   self.loader()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stopLoader(loader: loader)
            }
            getJSONforGeneral{
                self.tableview.removeFromSuperview()
                self.precautionTableView.removeFromSuperview()
                self.view.addSubview(self.containerView1)
                self.containerView1.clipsToBounds = true
                self.containerView1.layer.cornerRadius = 2
                self.containerView1.anchors(top: self.view.safeAreaLayoutGuide.topAnchor, topPad: 16, bottom: nil, bottomPad: 0, left: self.view.leftAnchor, leftPad: 16, right: self.view.rightAnchor, rightPad: 16, height: self.view.frame.height/2 - 100, width: self.view.frame.width - 32)
                self.view.addSubview(self.Button1)
                self.Button1.anchors(top: self.containerView1.bottomAnchor, topPad: 16, bottom: nil, bottomPad: 0, left: self.view.leftAnchor, leftPad: 16, right: self.view.rightAnchor, rightPad: 16, height: 50, width: 0)
                self.view.addSubview(self.callLabel)
                self.callLabel.anchors(top: self.Button1.topAnchor, topPad: 08, bottom: nil, bottomPad: 0, left: self.Button1.leftAnchor, leftPad: 16, right: nil, rightPad: 0, height: 30, width: 30)
                
                self.view.addSubview(self.Button2)
                self.Button2.anchors(top: self.Button1.bottomAnchor, topPad: 16, bottom: nil, bottomPad: 0, left: self.view.leftAnchor, leftPad: 16, right: self.view.rightAnchor, rightPad: 16, height: 50, width: 0)
                
                self.view.addSubview(self.callLabel2)
                self.callLabel2.anchors(top: self.Button2.topAnchor, topPad: 08, bottom: nil, bottomPad: 0, left: self.Button2.leftAnchor, leftPad: 16, right: nil, rightPad: 0, height: 30, width: 30)
                
            }
            print("you are in Remedies")
            //view.backgroundColor = .green
        default:
         //   rowsToDisplay = pcr
            getJSONforPCR{
                self.tableview.reloadData()
            }
            print("you are in PCR")
           
        }

    }
    
    @objc func clickedButton1(){
        self.makePhoneCall(phoneNumber: "9849255834")
       }
    func makePhoneCall(phoneNumber: String) {

          if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {

              let alert = UIAlertController(title: ("Do you want to Call " + phoneNumber + "?"), message: nil, preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                  UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
              }))

              alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
              self.present(alert, animated: true, completion: nil)
          }
      }

    @objc func clickedButton2(){
                self.makePhoneCall(phoneNumber: "9841255837")
          }

    //MARK: - REACHABILITY CLASS CHECKS FOR INTERNET CONNECTIVITY WHEN VIEWWILLAPPEAR AND RESUME APP WHEN IT'S SWITCH FROM OFFLINE TO ONLINE
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        self.segmentedControl.selectedSegmentIndex = 0
        print("i'm in viewwillappear")
          let loader =   self.loader()
          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stopLoader(loader: loader)
        }
        getJSONforPCR {
            self.view.addSubview(self.tableview)
            self.self.tableview.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
            self.tableview.anchors(top: self.view.safeAreaLayoutGuide.topAnchor, topPad: 8, bottom: nil, bottomPad: 0, left: self.view.leftAnchor, leftPad: 16, right: self.view.rightAnchor, rightPad: 16, height: self.view.bounds.height - 50, width: 0)
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
            tableview.rowHeight = 150
            precautionTableView.rowHeight = 200
            
            setTableViewdelegates()
            tableview.register(symptomCell.self, forCellReuseIdentifier: "symptomCell")
            precautionTableView.register(precautionCell.self, forCellReuseIdentifier: "precautionCell")
           
        }
        
        func setTableViewdelegates() {
            tableview.delegate = self
            tableview.dataSource = self
            
            precautionTableView.delegate = self
            precautionTableView.dataSource = self
        }

        func getJSONforPCR(completed: @escaping () -> ()) {
         //   let url = URL(string: "http://covid.hostingofprologic.com/api/hospital/listby")
        let url = URL(string: "http://covid.hostingofprologic.com/api/symptom/listby")
           
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error == nil {
                    do {
                        self.symptomZeroCellVCModels = try JSONDecoder().decode([symptomZeroCellVCModel].self, from: data!)
                        DispatchQueue.main.async {
                            completed()
                        }
                    } catch {
                            print("Json Error")
                    }
                }
            }.resume()
        }
    
    func getJSONforPrecaution(completed: @escaping () -> ()) {
            let url = URL(string: "http://covid.hostingofprologic.com/api/precaution/listby")
            print("i'm in precaution url")
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error == nil {
                    do {
                        self.precautionZeroCellVCModels = try JSONDecoder().decode([precautionZeroCellVCModel].self, from: data!)
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
              let url = URL(string: "http://covid.hostingofprologic.com/api/symptom/listby")
              
              URLSession.shared.dataTask(with: url!) { (data, response, error) in
                  if error == nil {
                      do {
                          self.symptomZeroCellVCModels = try JSONDecoder().decode([symptomZeroCellVCModel].self, from: data!)
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

    extension zeroCellVC: UITableViewDelegate, UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            if tableView == precautionTableView {
                return precautionZeroCellVCModels.count
            } else {
                return symptomZeroCellVCModels.count }
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
            if tableView == precautionTableView {
                print("i'm in precaution cell")
                let cell = precautionTableView.dequeueReusableCell(withIdentifier: "precautionCell") as! precautionCell
                cell.layer.cornerRadius = 12
                let shadowPath2 = UIBezierPath(rect: cell.bounds)
                cell.layer.masksToBounds = false
                cell.layer.shadowColor = UIColor.black.cgColor
                cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
                cell.layer.shadowOpacity = 0.35
                cell.layer.shadowPath = shadowPath2.cgPath
                let precautionZeroCellVCmodel = precautionZeroCellVCModels[indexPath.section]
                cell.set(precautionZeroCellVCmodel: precautionZeroCellVCmodel)
                return cell
                
            } else {
                 print("i'm in symptoms cell")
                let cell = tableview.dequeueReusableCell(withIdentifier: Cells.tablecell) as! symptomCell
                cell.layer.cornerRadius = 12
                let shadowPath2 = UIBezierPath(rect: cell.bounds)
                cell.layer.masksToBounds = false
                cell.layer.shadowColor = UIColor.black.cgColor
                cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
                cell.layer.shadowOpacity = 0.35
                cell.layer.shadowPath = shadowPath2.cgPath
                let symptomZeroCellVCmodel = symptomZeroCellVCModels[indexPath.section]
                cell.set(symptomZeroCellVCmodel: symptomZeroCellVCmodel)
                return cell
            }
            
        }
        
}

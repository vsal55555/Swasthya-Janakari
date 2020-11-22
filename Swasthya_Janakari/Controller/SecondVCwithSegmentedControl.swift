//
//  SecondVCwithSegmentedControl.swift
//  Swasthya_Janakari
//
//  Created by macbook on 10/23/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class SecondVCwithSegmentedControl: UIViewController {
  
    
    let items = ["PCR", "Quarantine", "General"]
    lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        //control.backgroundColor = .mainPink()
        control.selectedSegmentTintColor = .mainPink()
        control.addTarget(self, action: #selector(handleSegmentedControlValueChanged(_:)), for: .valueChanged)
        return control
    }()
    
    let tableView = UITableView()
    
    let cellSpacingHeight: CGFloat = 10
          var hospitals = [hospitalInfo]()
      
          struct Cells {
              static let tablecell = "hospitalCell"
          }
          
    
    let pcr = ["76576", "hhf", "dhuhoof"]
    let quarantine = ["hfhf", "858", "kfgkgf"]
    let general = ["mihf", "998", "flkhff"]
    
    //master array
    lazy var rowsToDisplay = pcr
    
    @objc fileprivate func handleSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            rowsToDisplay = pcr
            print("you are in PCR http://covid.hostingofprologic.com/api/hospital/listby?typ=2&pgn=1&oby=ASC")
            
            //view.backgroundColor = .blue
        case 1:
            rowsToDisplay = quarantine
            print("you are in Quarantine http://covid.hostingofprologic.com/api/hospital/listby?typ=1&pgn=1&oby=ASC")
            //view.backgroundColor = .red
        case 2:
            rowsToDisplay = general
            print("you are in General http://covid.hostingofprologic.com/api/hospital/listby?typ=0&pgn=1&oby=ASC")
            //view.backgroundColor = .green
        default:
            rowsToDisplay = pcr
            print("you are in PCR http://covid.hostingofprologic.com/api/hospital/listby?typ=2&pgn=1&oby=ASC")
            //view.backgroundColor = .mainPink()
        }
        //tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configureTableView()
        tableView.dataSource = self
        tableView.delegate = self
        //MARK: -FETCH DATA FROM API
        getJSON {
            self.tableView.reloadData()
        }
        
    }

    fileprivate func setupViews() {
        /*
        view.addSubview(segmentedControl)
        segmentedControl.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 16, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor, rightPad: 16, height: 30, width: 0)
        
        view.addSubview(tableView)
        tableView.anchors(top: segmentedControl.bottomAnchor, topPad: 16, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor, rightPad: 16, height: 0, width: 0)
        */
        let stackView = UIStackView(arrangedSubviews: [segmentedControl, tableView])
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 12, bottom: view.bottomAnchor, bottomPad: 16, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor, rightPad: 16, height: 0, width: 0)
    }
    
    func configureTableView(){
           tableView.rowHeight = 100
           tableView.register(tableCell.self, forCellReuseIdentifier: "tableCell")
       }
    
    func getJSON(completed: @escaping () -> ()) {
             let url = URL(string: "http://covid.hostingofprologic.com/api/hospital/listby")
             
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

extension SecondVCwithSegmentedControl: UITableViewDelegate, UITableViewDataSource {
       
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
          
           //print(news)
           //print("\(news[0].title)")
           
           let cell = tableView.dequeueReusableCell(withIdentifier: Cells.tablecell) as! hospitalCell
           cell.backgroundColor = .blue
           cell.layer.borderColor = UIColor.black.cgColor
           cell.layer.borderWidth = 1
           cell.layer.cornerRadius = 8
           cell.clipsToBounds = true
           
           let hospitalinfo = hospitals[indexPath.section]
           cell.set(hospitalinfo: hospitalinfo)
           
           
            
           return cell
           
       }
       
       
   }

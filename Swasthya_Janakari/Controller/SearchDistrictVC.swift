//
//  SearchDistrictVC.swift
//  Swasthya_Janakari
//
//  Created by macbook on 11/12/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import Foundation
import iOSDropDown


class SearchDistrictVC: UIViewController, UIScrollViewDelegate {
    
    private let apiCaller = APICaller()
    var tableview = UITableView()
    let cellSpacingHeight: CGFloat = 20
    var districtData = [SearchDistrictModel]()
    var districtDataforPagination = [SearchDistrictModel]()
    var count = 0
    var searchbyDistrictViewModel = SearchbyDistrictViewModel()
    struct Cells {
        static let DistrictSearchTableCell = "SearchDistrictTableCell"
    }
    
    
    let  searchDistrictDropDown: DropDown = {
           let g = DropDown() //(frame: CGRect(x: 16, y: 100, width: 382, height: 48))
           g.translatesAutoresizingMaskIntoConstraints = false
           g.arrowSize = 5
           g.textAlignment = .center
           g.clipsToBounds = true
           g.text = "कुनै जिल्लाको एक मात्र तथ्याङ्‌कको लागी छनोट गर्नुहोस्"
           g.font = UIFont.systemFont(ofSize: 18)
           g.layer.cornerRadius = 5
           g.layer.borderWidth = 1
        g.layer.borderColor = .init(srgbRed: 0.33, green: 0.94, blue: 0.77, alpha: 1)
          return g
      }()
    let sampleLabel: UILabel = {
        var v = UILabel(frame: CGRect(x: 16, y: 100, width: 364, height: 48))
        v.textColor = .black
        return v
    }()
    
    let arrowLabel: UIImageView = {
          let v = UIImageView()
          v.image = UIImage(systemName: "arrow.right")
          v.contentMode = .scaleAspectFill
          return v
      }()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
       
        //MARK: =GENDER DROPDOWN INIT
        view.addSubview(searchDistrictDropDown)
    
        searchDistrictDropDown.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPad: 16, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor, rightPad: 16, height: 48, width: 0)
        searchDistrictDropDown.isSearchEnable = false
        searchDistrictDropDown.listHeight = view.frame.height - 500
        print(view.frame.height)
        searchDistrictDropDown.rowHeight = 48
        searchDistrictDropDown.selectedRowColor = UIColor(red: 197 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1.0)
        searchDistrictDropDown.didSelect { (selectedText, index, id) in
            self.sampleLabel.text = selectedText
            print("Selected String: \(selectedText) \n index: \(index+1) \n \(id)")
            let loader =   self.loader()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.stopLoader(loader: loader)
            }
            self.getUserSearchDistrict(id: id) {
                self.tableview.reloadData()
            }
        }
        
//        view.addSubview(arrowLabel)
//        arrowLabel.anchors(top: searchDistrictDropDown.topAnchor, topPad: 12, bottom: nil, bottomPad: 0, right: searchDistrictDropDown.rightAnchor, rightPad: 04, height: 30, width: 30)
        
         configureTableView()
         
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchbyDistrictViewModel.createRequesttoSearchDistrictID { checked in
                             switch checked {
                             case .success(let stir):
                                 print("I'm in home screen")
                                 print("this is full data\(stir)")
                                 
                                 print("this is required data \(self.searchbyDistrictViewModel.yourDataArrayUsedInTheSourceofDistrictPicker)")
                                 print("this is DistrictID \(self.searchbyDistrictViewModel.yourDataArrayUsedInTheSourceofDistrictPickerID)")
                             case .failure(.nothingFound):
                                 print("status false")
                             }
                         }
                   let loader =   self.loader()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.searchDistrictDropDown.optionArray = self.searchbyDistrictViewModel.yourDataArrayUsedInTheSourceofDistrictPicker
            // ["11", "43", "26", "11", "45", "40"] to [11, 43, 26, 11, 45, 40]
            self.searchDistrictDropDown.optionIds = self.searchbyDistrictViewModel.yourDataArrayUsedInTheSourceofDistrictPickerID.compactMap { Int($0) }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.searchDistrictDropDown.optionArray = self.searchbyDistrictViewModel.yourDataArrayUsedInTheSourceofDistrictPicker
            // ["11", "43", "26", "11", "45", "40"] to [11, 43, 26, 11, 45, 40]
            self.searchDistrictDropDown.optionIds = self.searchbyDistrictViewModel.yourDataArrayUsedInTheSourceofDistrictPickerID.compactMap { Int($0) }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.searchDistrictDropDown.optionArray = self.searchbyDistrictViewModel.yourDataArrayUsedInTheSourceofDistrictPicker
            // ["11", "43", "26", "11", "45", "40"] to [11, 43, 26, 11, 45, 40]
            self.searchDistrictDropDown.optionIds = self.searchbyDistrictViewModel.yourDataArrayUsedInTheSourceofDistrictPickerID.compactMap { Int($0) }
        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.stopLoader(loader: loader)
        }
        
        /*
        getDistrictListData {
        print("i'm in main thread")
            self.tableview.reloadData()
              }  */
        apiCaller.createRequesttoFetchDataForPagination(url: "http://covid.hostingofprologic.com/api/district/listby?pgn=\(count)&oby=DESC", completionHandler: { checked in
            switch checked {
            case .success(let data):
               // self.districtDataforPagination = data
                self.districtData = data
                DispatchQueue.main.async {
                     self.tableview.reloadData()
                }
            case .failure(_):
                break
            }
        })
        
        configureTableView()
    }
    
    func getUserSearchDistrict(id: Int, completed: @escaping () -> ()) {
       
       
        let url = URL(string: "http://covid.hostingofprologic.com/api/district/search?id=\(id)")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
               if error == nil {
                   do {
                       self.districtData = try JSONDecoder().decode([SearchDistrictModel].self, from: data!)
                       DispatchQueue.main.async {
                           completed()
                       }
                   } catch {
                           print("Json Error")
                   }
               }
           }.resume()
       }
    
    func configureTableView() {
              view.addSubview(tableview)
              tableview.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
              tableview.anchors(top: searchDistrictDropDown.bottomAnchor, topPad: 16, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor, rightPad: 16, height: view.bounds.height - 50, width: 0)
              setTableViewdelegates()
              tableview.rowHeight = 100
              tableview.register(SearchDistrictTableCell.self, forCellReuseIdentifier: "SearchDistrictTableCell")
          }
          
          func setTableViewdelegates() {
              tableview.delegate = self
              tableview.dataSource = self
          }

          func getDistrictListData(completed: @escaping () -> ()) {
          let url = URL(string: "http://covid.hostingofprologic.com/api/district/listby?pgn=0&oby=DESC")
             print("i'm in http://covid.hostingofprologic.com/api/district/listby?pgn=0&oby=DESC")
              URLSession.shared.dataTask(with: url!) { (data, response, error) in
                  if error == nil {
                      do {
                          self.districtData = try JSONDecoder().decode([SearchDistrictModel].self, from: data!)
                       
                        print(self.districtData)
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

      extension SearchDistrictVC: UITableViewDelegate, UITableViewDataSource {
          
           func numberOfSections(in tableView: UITableView) -> Int {
                    return districtData.count
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
              
            let cell = tableview.dequeueReusableCell(withIdentifier: Cells.DistrictSearchTableCell) as! SearchDistrictTableCell
              cell.layer.cornerRadius = 2
              let shadowPath2 = UIBezierPath(rect: cell.bounds)
              cell.layer.masksToBounds = false
              cell.layer.shadowColor = UIColor.black.cgColor
              cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
              cell.layer.shadowOpacity = 0.35
              cell.layer.shadowPath = shadowPath2.cgPath
              
              let district = districtData[indexPath.section]
              cell.set(districtdata: district)
         
              return cell
              
          }
          
        private func createSpinnerFooter() -> UIView {
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
            let spinner = UIActivityIndicatorView()
            spinner.center = footerView.center
            footerView.addSubview(spinner)
            spinner.startAnimating()
            return footerView
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
           // print(tableview.contentSize.height - 100 - scrollView.frame.size.height)
            /*
            let position = scrollView.contentOffset.y
            if position > (tableview.contentSize.height - 100 - scrollView.frame.size.height) {
                //print fetch more data
                print("fetch more")
                guard !apiCaller.isPaginating else {
                    print("inside apicaller")
                    return
                }
                
                print("outside apicaller")
                self.tableview.tableFooterView = createSpinnerFooter()
                apiCaller.createRequesttoFetchDataForPagination(pagination: true) { [weak self] result in
                    DispatchQueue.main.async {
                         self?.tableview.tableFooterView = nil
                    }
                    switch result {
                    case .success(let moreData):
                        self?.districtData = moreData
                        
                        DispatchQueue.main.async {
                            self?.tableview.reloadData()
                        }
                    case .failure(_):
                        break
                    }
                }
            }  */
        }
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            print("1.called once")
            let offset = scrollView.contentOffset.y
            let height = scrollView.contentSize.height
            if offset > height - scrollView.frame.size.height{
                print("2. called once")
                count = count + 1
                print("*****\(count)**********")
                guard count < 6 else {
                    print("inside apicaller")
                    let loader =   self.loader()
                    apiCaller.createRequesttoFetchDataForPagination(url: "http://covid.hostingofprologic.com/api/district/listby?pgn=0&oby=DESC", completionHandler: { checked in
                        switch checked {
                        case .success(let data):
                            // self.districtDataforPagination = data
                            self.districtData = data
                            DispatchQueue.main.async {
                                self.tableview.reloadData()
                                self.count = 0
                                return
                            }
                        case .failure(_):
                            break
                        }
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.stopLoader(loader: loader)
                    }
                    return
                }
                self.tableview.tableFooterView = createSpinnerFooter()
                apiCaller.createRequesttoFetchDataForPagination(url: "http://covid.hostingofprologic.com/api/district/listby?pgn=\(count)&oby=DESC") { [weak self] result in
                    DispatchQueue.main.async {
                        self?.tableview.tableFooterView = nil
                    }
                    switch result {
                    case .success(let moreData):
                        self?.districtData = moreData
                        DispatchQueue.main.async {
                                self?.tableview.reloadData()
                        }
                    case .failure(_):
                        break
                    }
                }
                
            }
            
        }
      }


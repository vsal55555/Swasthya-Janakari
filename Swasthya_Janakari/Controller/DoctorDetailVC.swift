//
//  DoctorDetailVC.swift
//  Swasthya_Janakari
//
//  Created by macbook on 11/27/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit


class DoctorDetailVC: UIViewController {


    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .groupTableViewBackground
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    //MARK: FIRST CONTAINER VIEW
      lazy var mainContainerView: UIView = {
          let view = UIView()
          view.backgroundColor = .white
        
        view.addSubview(callButton)
        callButton.anchors(top: nil, topPad: 0, bottom: view.bottomAnchor, bottomPad: 16, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor, rightPad: 16, height: 50, width: 0)
        
        view.addSubview(callLabel)
        callLabel.anchors(top: callButton.topAnchor, topPad: 08, bottom: nil, bottomPad: 0, left: callButton.leftAnchor, leftPad: 16, right: nil, rightPad: 0, height: 30, width: 30)
        
        
        view.addSubview(doctorSymbol)
        doctorSymbol.homeAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 35, height: 35)
        
        view.addSubview(doctorDetails)
        doctorDetails.homeAnchor(top: view.topAnchor, left: doctorSymbol.rightAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, height: 18)
        
        view.addSubview(doctorBrief)
        doctorBrief.homeAnchor(top: doctorDetails.bottomAnchor, left: view.leftAnchor, bottom: callButton.topAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
        
           return view
      }()
      
    var doctorsImageView = UIImageView()
    
    var doctorNameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let specialistLabel: UILabel = {
          let label = UILabel()
          label.adjustsFontSizeToFitWidth = true
          //label.textColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
          label.font = UIFont.systemFont(ofSize: 17)
          return label
      }()
    
    let mailIcon: UIImageView = {
           let iv = UIImageView()
           iv.image = UIImage(named: "email")
           iv.contentMode = .scaleAspectFit
           return iv
       }()
    
    let emailLabel: UILabel = {
             let label = UILabel()
             label.adjustsFontSizeToFitWidth = true
             label.font = UIFont.systemFont(ofSize: 17)
             return label
         }()
    
    let phoneIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "call_icon")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let callLabel: UIImageView = {
          let v = UIImageView()
          v.image = UIImage(named: "call_icon")
          v.contentMode = .scaleAspectFill
          return v
      }()
    
    let doctorSymbol: UIImageView = {
          let v = UIImageView()
          v.image = UIImage(named: "symbol")
          v.contentMode = .scaleAspectFill
          return v
      }()
    
    
    let doctorDetails: UILabel = {
         let label = UILabel()
         label.text = "Doctor Details"
         label.adjustsFontSizeToFitWidth = true
         label.font = UIFont.boldSystemFont(ofSize: 17)
         return label
     }()
    
    let doctorBrief: UILabel = {
        let label = UILabel()
        //label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.gray.cgColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let callButton: UIButton = {
                 let button = UIButton(type: .system)
                 button.backgroundColor = UIColor.mainPink()
                 button.layer.cornerRadius = 10
                 let font = UIFont.systemFont(ofSize: 16)
                 let attributedTitle = NSMutableAttributedString(string:
                 "कल गनुहोस्", attributes: [NSAttributedString.Key.foregroundColor:
                     UIColor.white, NSAttributedString.Key.font : font ])
                 button.addTarget(self, action: #selector(clickedButton1), for: .touchUpInside)
                 button.setAttributedTitle(attributedTitle, for: .normal)
                 return button
          }()
    
    
      //MARK: - FIRST CONTAINERVIEW INIT
      let upperTitleLabel: UILabel = {
          let label = UILabel()
          label.textAlignment = .left
          label.text = "You Send"
          label.font = UIFont.boldSystemFont(ofSize: 17)
          label.textColor = .black
          return label
      }()
    
      let senderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1.5
        view.layer.borderColor = .init(srgbRed: 0.18, green: 0.20, blue: 0.21, alpha: 1.00)
          return view
      }()
   

    

    
    //MARK: -FOR SENDER CURRENCY GREEN LABEL
       let senderCurrencylabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .left
           label.text = "USD"
           label.font = UIFont.boldSystemFont(ofSize: 17)
           label.textColor = UIColor.rgb(red: 89, green: 156, blue: 120)
           return label
       }()
    
    
    let upperTitleLabel2: UILabel = {
          let label = UILabel()
          label.textAlignment = .left
          label.text = "They receive"
          label.font = UIFont.boldSystemFont(ofSize: 17)
          label.textColor = .black
          return label
      }()
    
      let receiverView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1.5
        view.layer.borderColor = .init(srgbRed: 0.18, green: 0.20, blue: 0.21, alpha: 1.00)
          return view
      }()
    
    //MARK: -FOR THEY RECIEVE CURRENCY RIGHT SIDE TEXT LABEL
    let receiverFixedNepallabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "NEPAL"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: -FOR NEPAL GREEN LABEL
       let nepalCurrencylabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .left
           label.text = "NEP"
           label.font = UIFont.boldSystemFont(ofSize: 17)
           label.textColor = UIColor.rgb(red: 89, green: 156, blue: 120)
           return label
       }()
    
    let upperTitleLabel3: UILabel = {
            let label = UILabel()
            label.textAlignment = .left
            label.text = "Purpose"
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.textColor = .black
            return label
        }()
      
        let purposeView: UIView = {
          let view = UIView()
          view.backgroundColor = .white
          view.clipsToBounds = true
          view.layer.cornerRadius = 5
          view.layer.borderWidth = 2
          view.layer.borderColor = .init(srgbRed: 0.58, green: 0.65, blue: 0.65, alpha: 1.00)
            return view
        }()
    
    
    

    
    let purposeDropdownLabel: UIImageView = {
        let u = UIImageView()
        u.image = UIImage(systemName: "chevron.down.square")
        u.tintColor = .gray
       return u
    }()
    
    let upperTitleLabel4: UILabel = {
          let label = UILabel()
          label.textAlignment = .left
          label.text = "Source of fund"
          label.font = UIFont.boldSystemFont(ofSize: 17)
          label.textColor = .black
          return label
      }()
    
      let sourceofFundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 2
        view.layer.borderColor = .init(srgbRed: 0.58, green: 0.65, blue: 0.65, alpha: 1.00)
          return view
      }()
    
       let sourceofFundDropdownLabel: UIImageView = {
              let u = UIImageView()
              u.image = UIImage(systemName: "chevron.down.square")
              u.tintColor = .gray
             return u
          }()
    
        
    
      
      let nextButton: UIButton = {
          let button = UIButton(type: .system)
          button.backgroundColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1)
          button.layer.cornerRadius = 10
          let font = UIFont.boldSystemFont(ofSize: 16)
          let attributedTitle = NSMutableAttributedString(string:
          "NEXT", attributes: [NSAttributedString.Key.foregroundColor:
              UIColor.white, NSAttributedString.Key.font : font ])
          button.addTarget(self, action: #selector(nextbutton), for: .touchUpInside)
          button.setAttributedTitle(attributedTitle, for: .normal)
          return button
      }()
     
    
    //MARK: -FOR SECOND CONTAINER VIEW LABELS
    let exchangeRatelabelinSecondContView: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Exchange Rate :"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.rgb(red: 89, green: 156, blue: 120)
        return label
    }()
    
    let feelabelinSecondContView: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Fee :"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.rgb(red: 89, green: 156, blue: 120)
        return label
    }()
    
    let totallabelinSecondContView: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Total :"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.rgb(red: 89, green: 156, blue: 120)
        return label
    }()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .groupTableViewBackground
        self.title = "Doctor Details"
        setDataSourceandDelegate()

        
        //MARK:- SCROLLVIEW ADDING AND CONSTRAINING
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        //MARK: -ADDING SUBVIEWS TO SCROLLVIEWS
        scrollView.addSubview(mainContainerView)
        mainContainerView.clipsToBounds = true
        mainContainerView.layer.cornerRadius = 12
        mainContainerView.homeAnchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, paddingTop: view.frame.width - 100 , paddingLeft: 10, width: view.frame.width - 20, height: 420)
        
        scrollView.addSubview(doctorsImageView)
        doctorsImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        doctorsImageView.homeAnchor(top: scrollView.topAnchor, paddingTop: 16, width: 120, height: 120)

        
        scrollView.addSubview(doctorNameLabel)
        doctorNameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        doctorNameLabel.homeAnchor(top: doctorsImageView.bottomAnchor, paddingTop: 16, height: 18)
        
        scrollView.addSubview(specialistLabel)
        specialistLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        specialistLabel.homeAnchor(top: doctorNameLabel.bottomAnchor, paddingTop: 16, height: 18)
        
        scrollView.addSubview(mailIcon)
        mailIcon.homeAnchor(top: specialistLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 25, height: 25)
        
        scrollView.addSubview(emailLabel)
        emailLabel.homeAnchor(top: specialistLabel.bottomAnchor, left: mailIcon.rightAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, height: 18)
        
        scrollView.addSubview(phoneIcon)
        phoneIcon.homeAnchor(top: mailIcon.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 04, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 25, height: 25)
        
        scrollView.addSubview(phoneLabel)
        phoneLabel.homeAnchor(top: emailLabel.bottomAnchor, left: phoneIcon.rightAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, height: 18)
        
        
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
    
    @objc func clickedButton1(){
        print("clicked me \(phoneLabel.text!)")
        let offsetIndex1: String.Index = phoneLabel.text!.index(phoneLabel.text!.startIndex, offsetBy: 05)
        let myNumber = phoneLabel.text!.substring(from: offsetIndex1)
        self.makePhoneCall(phoneNumber: myNumber)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
    }
    
 
    
    fileprivate func setDataSourceandDelegate() {
    
    //MARK: -GENDER PICKER DELAGATE & DATA SOURCE
        
        }
    
    //MARK: -SHOW SENDER PICKER @OBJC
    @objc func showSenderPicker(){
        print("i'm in @objc func show sender picker")
        
        
    }

    @objc func showReceiverPicker(){
           print("i'm in @objc func show receiver picker")
           
           
       }
    
    //MARK: -SHOW SENDER PICKER @OBJC
    @objc func showSourceofFundPicker(){
        //Formate Date
        //datePicker.datePickerMode = .date
      
        
    }
  
    
    //MARK: -SHOW SENDER PICKER @OBJC
    @objc func showPurposePicker(){
     
        
    }

    
    @objc func nextbutton() {
        print(123)
    }
    
}








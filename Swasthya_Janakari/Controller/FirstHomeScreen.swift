//
//  FirstHomeScreen.swift
//  PokedexMVC
//
//  Created by macbook on 9/22/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages   //package provides the reachability class for internet connectivity


class firstHomeScreen: UIViewController {
    
    //MARK: - REACHABILITY CLASS OBJECT
    let reachability = Reachability()
    
    
    let searchbyDistrictViewModel = SearchbyDistrictViewModel()
    
    //MARK: =SCROLLVIEW INIT
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: FIRST CONTAINER VIEW
    lazy var containerView1: UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
       
        //MARK: -ADD IMAGE1 TO FIRST CONTAINERVIEW
        view .addSubview(cellImage1)
        cellImage1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cellImage1.homeAnchor(left: view.leftAnchor, paddingLeft: 16, width: 100, height: 100)
        cellImage1.layer.cornerRadius = 50
        
        
        
        //MARK: -ADD UPPERHEADER1 TO FIRST CONTAINERVIEW
        view.addSubview(upperTitleLabel)
      //  upperTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        upperTitleLabel.homeAnchor(top: view.topAnchor, left: cellImage1.rightAnchor, paddingTop: 12, paddingLeft: 18)
        
        //MARK: -ADD LOWERHEADER1 TO FIRST CONTAINERVIEW
        view.addSubview(lowerTitleLabel)
       // lowerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lowerTitleLabel.homeAnchor(top: upperTitleLabel.bottomAnchor,left: cellImage1.rightAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 18, paddingRight: 32)

    
        //MARK: -ADD BUTTON1 TO FIRST CONTAINERVIEW
             view.addSubview(button1)
             button1.homeAnchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 24, paddingRight: 54, width: 170, height: 42)
        
        view.addSubview(arrowLabel3)
        arrowLabel3.anchors(top: button1.topAnchor, topPad: 08, bottom: nil, bottomPad: 0, left: nil, leftPad: 0, right: button1.rightAnchor, rightPad: 04, height: 30, width: 30)
         return view
    }()
    
    
    
        
        //MARK:  Second container
           lazy var containerView2: UIView = {
               let view = UIView()
               view.backgroundColor = .init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
            /*
        //MARK: -ADD IMAGE2 TO Second CONTAINERVIEW
            view .addSubview(cellImage2)
            cellImage2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            cellImage2.homeAnchor(left: view.leftAnchor, paddingLeft: 16, width: 100, height: 100)
            cellImage2.layer.cornerRadius = 50
            */
            
            
            //MARK: -ADD secondUPPERHEADER TO second CONTAINERVIEW
              view.addSubview(secondupperTitleLabel)
            //  upperTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
              secondupperTitleLabel.homeAnchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 12, paddingRight: 32)
              
              //MARK: -ADD secondLOWERHEADER TO second CONTAINERVIEW
              view.addSubview(secondlowerTitleLabel)
             // lowerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            secondlowerTitleLabel.homeAnchor(top: secondupperTitleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 12, paddingLeft: 32)
            
            
            //MARK: -ADD NUMBERUPPERLABEL1 TO Second CONTAINERVIEW
            view .addSubview(numberupperTitleLabel1)
            //numberupperTitleLabel1.text = myArrayfornumberupperTitleLabel1
            numberupperTitleLabel1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            numberupperTitleLabel1.homeAnchor(left: view.leftAnchor, paddingLeft: 16)
            
            
            //MARK: -ADD NUMBERLOWERLABEL1 TO Second CONTAINERVIEW
            view .addSubview(numberlowerTitleLabel1)
            //numberlowerTitleLabel1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            numberlowerTitleLabel1.homeAnchor(top: numberupperTitleLabel1.bottomAnchor, left: view.leftAnchor, paddingTop: 12, paddingLeft: 16)

            
            //MARK: -ADD NUMBERUPPERLABEL2 TO Second CONTAINERVIEW
            view .addSubview(numberupperTitleLabel2)
            //numberupperTitleLabel2.text = myArrayfornumberupperTitleLabel2
            numberupperTitleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            numberupperTitleLabel2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            numberupperTitleLabel2.homeAnchor(top: secondlowerTitleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 12, paddingLeft: 16)
            
            
            //MARK: -ADD NUMBERUPPERLABEL2 TO Second CONTAINERVIEW
            view .addSubview(numberlowerTitleLabel2)
            //numberlowerTitleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            numberlowerTitleLabel2.homeAnchor(top: numberupperTitleLabel2.bottomAnchor, left: numberlowerTitleLabel1.rightAnchor, paddingTop: 12, paddingLeft: 40)
        
            
            //MARK: -ADD NUMBERUPPERLABEL3 TO Second CONTAINERVIEW
            view .addSubview(numberupperTitleLabel3)
            //numberupperTitleLabel3.text = myArrayfornumberupperTitleLabel3
            numberupperTitleLabel3.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            numberupperTitleLabel3.homeAnchor(right: view.rightAnchor, paddingRight: 16)
            
            //MARK: -ADD NUMBERUPPERLABEL3 TO Second CONTAINERVIEW
            view .addSubview(numberupperTitleLabel3)
            numberupperTitleLabel3.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            numberupperTitleLabel3.homeAnchor(right: view.rightAnchor, paddingRight: 32)
            
            
        //MARK: -ADD NUMBERLOWERLABEL3 TO Second CONTAINERVIEW
        view .addSubview(numberlowerTitleLabel3)
        //numberlowerTitleLabel1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        numberlowerTitleLabel3.homeAnchor(top: numberupperTitleLabel3.bottomAnchor, right: view.rightAnchor, paddingTop: 12, paddingRight: 16)
            
            //MARK: -ADD BUTTON2 TO second CONTAINERVIEW
                 view.addSubview(button2)
                 button2.homeAnchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 24, paddingRight: 54, width: 170, height: 42)
            
            view.addSubview(arrowLabel2)
            arrowLabel2.anchors(top: button2.topAnchor, topPad: 08, bottom: nil, bottomPad: 0, left: nil, leftPad: 0, right: button2.rightAnchor, rightPad: 04, height: 30, width: 30)
     return view
      }()
    
    //MARK:  Third container
             lazy var containerView3: UIView = {
                 let view = UIView()
                view.backgroundColor = .init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
                
          //MARK: -ADD IMAGE2 TO third CONTAINERVIEW
              view .addSubview(cellImage3)
              cellImage3.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
              cellImage3.homeAnchor(left: view.leftAnchor, paddingLeft: 16, width: 100, height: 100)
              cellImage3.layer.cornerRadius = 50
              
              
              
              //MARK: -ADD thirdUPPERHEADER1 TO third CONTAINERVIEW
              view.addSubview(thirdupperTitleLabel)
            //  upperTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
              thirdupperTitleLabel.homeAnchor(top: view.topAnchor, left: cellImage3.rightAnchor, paddingTop: 12, paddingLeft: 18)
              //MARK: -ADD thirdLOWERHEADER1 TO third CONTAINERVIEW
              view.addSubview(thirdlowerTitleLabel)
             // lowerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
              thirdlowerTitleLabel.homeAnchor(top: thirdupperTitleLabel.bottomAnchor, left: cellImage3.rightAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 18, paddingRight: 32)

          
              //MARK: -ADD BUTTON3 TO second CONTAINERVIEW
                   view.addSubview(button3)
                   button3.homeAnchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 24, paddingRight: 54, width: 170, height: 42)
                
                view.addSubview(arrowLabel)
                arrowLabel.anchors(top: button3.topAnchor, topPad: 08, bottom: nil, bottomPad: 0, left: nil, leftPad: 0, right: button3.rightAnchor, rightPad: 04, height: 30, width: 30)
          
       return view
        }()
    
    
    
    
    //MARK: - FIRST CONTAINERVIEW INIT
    let upperTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "आकस्मिक सम्पर्क"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    
    let lowerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
        label.text = "यदी तपाईंलाई कोरोना सम्बन्धी शंका लागेमा तुरुन्त डायल गर्नुहोस्"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    let cellImage1: UIImageView = {
           let iv = UIImageView()
           iv.backgroundColor = .red
           iv.image = #imageLiteral(resourceName: "home-icon2-1")
           iv.contentMode = .scaleAspectFill
           iv.clipsToBounds = true
           return iv
       }()
    
    let button1: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.mainPink()
        button.layer.cornerRadius = 10
        let font = UIFont.systemFont(ofSize: 16)
        let attributedTitle = NSMutableAttributedString(string:
        "डायल गर्नुहोस्", attributes: [NSAttributedString.Key.foregroundColor:
            UIColor.white, NSAttributedString.Key.font : font ])
        button.addTarget(self, action: #selector(button1SignIn), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        return button
    }()
    
    
    //MARK: - SECOND CONTAINERVIEW INIT
    let secondupperTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "कोभिड-१९ तथ्याङ्‌क"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    
    let secondlowerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "नेपालको पछिल्लो २४ घन्टाको तथ्याङ्क"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    let numberupperTitleLabel1: UILabel = {                         //front upper label 1 ****number****
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    let numberlowerTitleLabel1: UILabel = {                         //front lower label 1
        let label = UILabel()
        label.textAlignment = .center
        label.text = "नयाँ सङ्‌कमित"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    let numberupperTitleLabel2: UILabel = {                         //front upper label 2  ****number****
           let label = UILabel()
           label.textAlignment = .center
           label.font = UIFont.boldSystemFont(ofSize: 22)
           label.textColor = .black
           return label
       }()
    
    let numberlowerTitleLabel2: UILabel = {                            //front lower label 2
            let label = UILabel()
            label.textAlignment = .center
            label.text = "निको भएको"
            label.font = UIFont.systemFont(ofSize: 22)
            label.textColor = .black
            return label
        }()
    
    let numberupperTitleLabel3: UILabel = {                            //front upper label 3   ****number****
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    let numberlowerTitleLabel3: UILabel = {                            //front lower label 3
        let label = UILabel()
        label.textAlignment = .center
        label.text = "मृत्यु"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()

    
    let button2: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.mainPink()
        button.layer.cornerRadius = 10
        let font = UIFont.systemFont(ofSize: 16)
        let attributedTitle = NSMutableAttributedString(string:
        "पुरा तथ्याङ्क", attributes: [NSAttributedString.Key.foregroundColor:
            UIColor.white, NSAttributedString.Key.font : font ])
        button.addTarget(self, action: #selector(button2SignIn), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        return button
    }()
    
   //MARK: - THIRD CONTAINERVIEW INIT
      let thirdupperTitleLabel: UILabel = {
          let label = UILabel()
          label.textAlignment = .center
          label.text = "डाक्टरसँग परामर्श"
          label.font = UIFont.boldSystemFont(ofSize: 30)
          label.textColor = .black
          return label
      }()
      
      let thirdlowerTitleLabel: UILabel = {
          let label = UILabel()
          label.textAlignment = .left
          label.numberOfLines = 0
          label.sizeToFit()
          label.text = "डाक्टरहरुसँग परामर्श लिन चाहानुहुन्छ भने सम्पर्क गर्नुहोस"
          label.font = UIFont.systemFont(ofSize: 17)
          label.textColor = .black
          return label
      }()
      
      let cellImage3: UIImageView = {
             let iv = UIImageView()
             iv.backgroundColor = .red
             iv.image = #imageLiteral(resourceName: "home-icon2")
             iv.contentMode = .scaleAspectFill
             iv.clipsToBounds = true
             return iv
         }()
      
      let button3: UIButton = {
          let button = UIButton(type: .system)
          button.backgroundColor = UIColor.mainPink()
          button.layer.cornerRadius = 10
          let font = UIFont.systemFont(ofSize: 16)
          let attributedTitle = NSMutableAttributedString(string:
          "सम्पर्क गर्नुहोस", attributes: [NSAttributedString.Key.foregroundColor:
              UIColor.white, NSAttributedString.Key.font : font ])
          button.addTarget(self, action: #selector(button3SignIn), for: .touchUpInside)
          button.setAttributedTitle(attributedTitle, for: .normal)
        button.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
          return button
      }()
    
    let arrowLabel: UIImageView = {
            let v = UIImageView()
          v.tintColor = .white
            v.image = UIImage(systemName: "arrow.right")
            v.contentMode = .scaleAspectFill
            return v
        }()
    
    let arrowLabel2: UIImageView = {
               let v = UIImageView()
             v.tintColor = .white
               v.image = UIImage(systemName: "arrow.right")
               v.contentMode = .scaleAspectFill
               return v
           }()
    
    let arrowLabel3: UIImageView = {
               let v = UIImageView()
             v.tintColor = .white
               v.image = UIImage(systemName: "arrow.right")
               v.contentMode = .scaleAspectFill
               return v
           }()
    
    var myArrayfornumberupperTitleLabel1: String = ""
    var myArrayfornumberupperTitleLabel2: String = ""
    var myArrayfornumberupperTitleLabel3: String = ""
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        print("i'm in first home screen \(appDelegate.myArrayfornumberupperTitleLabel1)")
        print(appDelegate.myArrayfornumberupperTitleLabel2)
        print(appDelegate.myArrayfornumberupperTitleLabel3)
       
        numberupperTitleLabel1.text = appDelegate.myArrayfornumberupperTitleLabel1
        numberupperTitleLabel1.textColor = .orange
        numberupperTitleLabel2.text = appDelegate.myArrayfornumberupperTitleLabel2
        numberupperTitleLabel2.textColor = .green
        numberupperTitleLabel3.text = appDelegate.myArrayfornumberupperTitleLabel3
        numberupperTitleLabel3.textColor = .red
        
        
        //MARK:- SCROLLVIEW ADDING AND CONSTRAINING
              view.addSubview(scrollView)
              scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
              scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
              scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
              scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
      
        //MARK: =ADDING SUBVIEWS IN SCROLLVIEWS
        scrollView.addSubview(containerView1)
        containerView1.clipsToBounds = true
        containerView1.layer.cornerRadius = 12
        containerView1.homeAnchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: view.frame.width - 20, height: 200)
        containerView1.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        
        scrollView.addSubview(containerView2)
        containerView2.clipsToBounds = true
        containerView2.layer.cornerRadius = 12
        containerView2.homeAnchor(top: containerView1.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: view.frame.width - 20, height: 300)
        containerView2.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        
        scrollView.addSubview(containerView3)
        containerView3.clipsToBounds = true
        containerView3.layer.cornerRadius = 12
        containerView3.homeAnchor(top: containerView2.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: nil, paddingTop: 16, paddingLeft: 10, paddingBottom: 16, paddingRight: 0, width: view.frame.width - 20, height: 200)
        containerView3.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        
        
        //MARK: =ADDING SUBVIEWS WITHOUT SCROLLVIEWS
      /*
        
        view.addSubview(containerView1)
         containerView1.centerXAnchor.constraint(equalTo: view.centerXAnchor)
         containerView1.homeAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingRight: 8, width: view.frame.width - 10, height: 200)
         
        view.addSubview(containerView2)
        containerView2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
         containerView2.homeAnchor(top: containerView1.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingRight: 8, width: view.frame.width - 10, height: 300)
        
        view.addSubview(containerView3)
        containerView3.centerXAnchor.constraint(equalTo: view.centerXAnchor)
         containerView3.homeAnchor(top: containerView2.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingRight: 8, width: view.frame.width - 10, height: 200)
        */
    }
    
     //MARK: - REACHABILITY CLASS CHECKS FOR INTERNET CONNECTIVITY WHEN VIEWWILLAPPEAR
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        do {
            print("i'm in first home screen \(appDelegate.myArrayfornumberupperTitleLabel1)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.numberupperTitleLabel1.text = self.appDelegate.myArrayfornumberupperTitleLabel1
                self.numberupperTitleLabel2.text = self.appDelegate.myArrayfornumberupperTitleLabel2
                self.numberupperTitleLabel3.text = self.appDelegate.myArrayfornumberupperTitleLabel3
            }
         
            
            try reachability?.startNotifier()
        } catch let error {
            print(error)
        }
        handleReachability()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        print("***********viewdidAppear called**************")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.numberupperTitleLabel1.text = self.appDelegate.myArrayfornumberupperTitleLabel1
            self.numberupperTitleLabel2.text = self.appDelegate.myArrayfornumberupperTitleLabel2
            self.numberupperTitleLabel3.text = self.appDelegate.myArrayfornumberupperTitleLabel3
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.numberupperTitleLabel1.text = self.appDelegate.myArrayfornumberupperTitleLabel1
            self.numberupperTitleLabel2.text = self.appDelegate.myArrayfornumberupperTitleLabel2
            self.numberupperTitleLabel3.text = self.appDelegate.myArrayfornumberupperTitleLabel3
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.numberupperTitleLabel1.text = self.appDelegate.myArrayfornumberupperTitleLabel1
            self.numberupperTitleLabel2.text = self.appDelegate.myArrayfornumberupperTitleLabel2
            self.numberupperTitleLabel3.text = self.appDelegate.myArrayfornumberupperTitleLabel3
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.numberupperTitleLabel1.text = self.appDelegate.myArrayfornumberupperTitleLabel1
            self.numberupperTitleLabel2.text = self.appDelegate.myArrayfornumberupperTitleLabel2
            self.numberupperTitleLabel3.text = self.appDelegate.myArrayfornumberupperTitleLabel3
        }
        
        numberupperTitleLabel1.text = appDelegate.myArrayfornumberupperTitleLabel1
        numberupperTitleLabel2.text = appDelegate.myArrayfornumberupperTitleLabel2
        numberupperTitleLabel3.text = appDelegate.myArrayfornumberupperTitleLabel3
        
        numberupperTitleLabel1.text = appDelegate.myArrayfornumberupperTitleLabel1
        numberupperTitleLabel2.text = appDelegate.myArrayfornumberupperTitleLabel2
        numberupperTitleLabel3.text = appDelegate.myArrayfornumberupperTitleLabel3
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
    
        //MARK: - Selectors OBJECTIVE C CODES CLICK BUTTON
         @objc func showSearchBar() {
             print(123)
         }
         
         @objc func button1SignIn(){
            
          
            
            // create an actionSheet
            let actionSheetController: UIAlertController = UIAlertController(title: "स्वास्थ्या जनाकारी", message: "यदी तपाईलाई स्वास्थ सम्बन्धी समस्या भएमा निम्न नम्बरहरुमा तुरुन्त कल गर्नुहोस्", preferredStyle: .actionSheet)

            // create an action
            let firstAction: UIAlertAction = UIAlertAction(title: "Call to ९८४९२५५८२४", style: .default) { action -> Void in

                print("First Action pressed")
                self.makePhoneCall(phoneNumber: "९८४९२५५८२४")
            }

            let secondAction: UIAlertAction = UIAlertAction(title: "Call to ९८५१२२५८३९", style: .default) { action -> Void in

                print("Second Action pressed")
                self.makePhoneCall(phoneNumber: "९८५१२२५८३९")
            }
            let thirdAction: UIAlertAction = UIAlertAction(title: "Call to ९८५१२५५८३५", style: .default) { action -> Void in

                print("Second Action pressed")
                self.makePhoneCall(phoneNumber: "९८५१२५५८३५")
            }

            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }

            // add actions
            actionSheetController.addAction(firstAction)
            actionSheetController.addAction(secondAction)
            actionSheetController.addAction(thirdAction)
            actionSheetController.addAction(cancelAction)

            // present an actionSheet...
            // present(actionSheetController, animated: true, completion: nil)   // doesn't work for iPad

            //actionSheetController.popoverPresentationController?.sourceView = yourSourceViewName // works for both iPhone & iPad

            present(actionSheetController, animated: true) {
                print("option menu presented")
            }

            
            
         }
   
    func makePhoneCall(phoneNumber: String) {

        if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {

            let alert = UIAlertController(title: ("Call " + phoneNumber + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
        @objc func button2SignIn(){
            print("clicked me")
            //let layout = UICollectionViewFlowLayout()
            let first = chartVC()//since this is a collection viewcontroller you need to pass layout also.
            //let first = DoctorVC()
            self.navigationController?.pushViewController(first, animated: true)
        }
    
        @objc func button3SignIn(){
        print("clicked me")
         let vc = DoctorVC()
         self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        //MARK: -NAVIGATION CONTROLLER PART
        func configureViewComponents() {
              // collectionView.backgroundColor = .white
               navigationController?.navigationBar.barTintColor = .mainPink()
               navigationController?.navigationBar.barStyle = .black
               navigationController?.navigationBar.isTranslucent = false
               navigationItem.title = "COVID-19"
               
               navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
               navigationItem.rightBarButtonItem?.tintColor = .white
               //collectionView.register(Cell.self, forCellWithReuseIdentifier: reuseIdentifier)
           }
}

//MARK: EXTENSION TO BUTTON


//MARK: VIEW CONSTRAINT FOR HOMEANCHOR
extension UIView {
    
    
    func homeAnchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0,
                paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

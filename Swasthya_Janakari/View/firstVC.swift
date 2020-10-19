//
//  PokedexController.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 8/25/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "myCell" //minimize the possibility of human error

//let layout = UICollectionViewFlowLayout()
//private let secondtableVC = chartVC(collectionViewLayout: layout)

class firstVC: UIViewController, UIScrollViewDelegate {
}
    /*
   
    //lazy var contentViewSize = CGSize(width: 200, height: 1000)
 //  lazy var contentViewSize = CGSize(width: scrollView.bounds.size.width, height: self.view.frame.height )
  //  lazy var contentViewSize = CGSize(width: scrollView.bounds.size.width, height: scrollView.bounds.size.height)
    
    //MARK: FIRST CONTAINER VIEW
    lazy var containerView1: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink()
        
        view.addSubview(upperTitleLabel)
        upperTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        upperTitleLabel.homeAnchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(lowerTitleLabel)
        lowerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lowerTitleLabel.homeAnchor(top: upperTitleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 32, paddingRight: 32)

        
        view.addSubview(nepalTotalCasesLabel1)
        nepalTotalCasesLabel1.homeAnchor(top: lowerTitleLabel.bottomAnchor, paddingTop: 12, paddingLeft: 32)
        //right: view.rightAnchor
        
        view.addSubview(nepalLabel1)
        nepalLabel1.homeAnchor(top: nepalTotalCasesLabel1.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(nepalTotalCasesLabel2)
        nepalTotalCasesLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //nepalTotalCasesLabel2.homeAnchor(top: lowerTitleLabel.bottomAnchor, left: nepalTotalCasesLabel1.trailingAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 32)
        return view
    }()
    
    
    //MARK: SECOND CONTAINERVIEW
    
    lazy var containerView2: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink()

        /* correct
        view.addSubview(upperTitleLabel2)
        upperTitleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        upperTitleLabel2.homeAnchor(top: view.topAnchor, paddingTop: 12)
         */
        
        view .addSubview(cellImage1)
        cellImage1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cellImage1.homeAnchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 100, paddingLeft: 16, paddingBottom: 100, width: 120, height: 120)
        //cellImage1.homeAnchor(top: view.topAnchor, paddingTop: 100, width: 120, height: 120)
        
        cellImage1.layer.cornerRadius = 60
        
        view.addSubview(button1)
        button1.homeAnchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 16, paddingRight: 32, width: 120)
        
        view.addSubview(cellOneUpperTitleLabel)
        cellOneUpperTitleLabel.homeAnchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 16, paddingRight: 32, height: 50)
        
        view.addSubview(cellOneLowerTitleLabel)
        cellOneLowerTitleLabel.homeAnchor(top: cellOneUpperTitleLabel.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingRight: 32, width: 150)
        
        /*
        view.addSubview(lowerTitleLabel)
        lowerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lowerTitleLabel.homeAnchor(top: upperTitleLabel.bottomAnchor, paddingTop: 12)

        
        view.addSubview(nepalTotalCasesLabel)
        nepalTotalCasesLabel.homeAnchor(top: lowerTitleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 32)


        view.addSubview(nepalLabel)
        nepalLabel.homeAnchor(top: nepalTotalCasesLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 32)
        */
        return view
    }()
    
    //MARK:  Container third
/*
    lazy var containerView3: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink()

        /* correct
        view.addSubview(upperTitleLabel2)
        upperTitleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        upperTitleLabel2.homeAnchor(top: view.topAnchor, paddingTop: 12)
         */
        
        view .addSubview(cellImage2)
        cellImage2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cellImage2.homeAnchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 100, paddingLeft: 16, paddingBottom: 100, width: 120, height: 120)
       // cellImage2.homeAnchor(top: view.topAnchor, paddingTop: 100, width: 120, height: 120)
        
        cellImage2.layer.cornerRadius = 60
        
        view.addSubview(button2)
        button2.homeAnchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 16, paddingRight: 32, width: 120)
        
        view.addSubview(cellThreeUpperTitleLabel)
        cellThreeUpperTitleLabel.homeAnchor(top: view.topAnchor, right: view.rightAnchor, paddingTop: 16, paddingRight: 32, height: 50)
        
        view.addSubview(cellThreeLowerTitleLabel)
        cellThreeLowerTitleLabel.homeAnchor(top: cellThreeUpperTitleLabel.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingRight: 32, width: 150)
        
        /*
        view.addSubview(lowerTitleLabel)
        lowerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lowerTitleLabel.homeAnchor(top: upperTitleLabel.bottomAnchor, paddingTop: 12)

        
        view.addSubview(nepalTotalCasesLabel)
        nepalTotalCasesLabel.homeAnchor(top: lowerTitleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 32)


        view.addSubview(nepalLabel)
        nepalLabel.homeAnchor(top: nepalTotalCasesLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 32)
        */
        return view
    }()
    */
    
    /*
 
     lazy var containerView3: UIView = {
           let view = UIView()
           view.backgroundColor = .mainPink()
           
           view.addSubview(upperTitleLabel2)
           upperTitleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           upperTitleLabel2.homeAnchor(top: view.topAnchor, paddingTop: 12)
           
           return view
       }()
    
    lazy var containerView4: UIView = {
           let view = UIView()
           view.backgroundColor = .mainPink()
           
           view.addSubview(upperTitleLabel2)
           upperTitleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           upperTitleLabel2.homeAnchor(top: view.topAnchor, paddingTop: 12)
           
           return view
       }()
    */
 
    let upperTitleLabel2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "covi"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    let upperTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "covid -19 Statistics"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    let lowerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Nepal 24 hours cases"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    //Mark: - Cases Number 1
    let nepalTotalCasesLabel1: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "१४५४"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .yellow
        return label
    }()
    
    let nepalLabel1: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "New Cases"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    //Mark: - Cases Number 2
    let nepalTotalCasesLabel2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "२२२"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .yellow
        return label
    }()
    
    
     //Mark: - Cell title
    let cellOneUpperTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Urgent Call"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    
    
    let cellOneLowerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "If fell infected Please click and dial"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()

    
    //Mark: Image add to container
    let cellImage1: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.image = #imageLiteral(resourceName: "covid-19")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let button1: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.rgb(red: 89, green: 156, blue: 120)
        button.layer.cornerRadius = 10
        let font = UIFont.systemFont(ofSize: 16)
        let attributedTitle = NSMutableAttributedString(string:
        "Dail Number ", attributes: [NSAttributedString.Key.foregroundColor:
            UIColor.white, NSAttributedString.Key.font : font ])
        button.addTarget(self, action: #selector(button1SignIn), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    //MARK: HOME SCREEN Second Cell
    
       let cellThreeUpperTitleLabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           label.text = "Contact Doctor"
           label.font = UIFont.boldSystemFont(ofSize: 30)
           label.textColor = .black
           return label
       }()
       
       
       let cellThreeLowerTitleLabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           label.text = "To get suggestion click and dial"
           label.font = UIFont.systemFont(ofSize: 22)
           label.textColor = .black
           return label
       }()
       
       
       let cellImage2: UIImageView = {
           let iv = UIImageView()
           iv.backgroundColor = .red
           iv.image = #imageLiteral(resourceName: "number")
           iv.contentMode = .scaleAspectFill
           iv.clipsToBounds = true
           return iv
       }()
       
       let button2: UIButton = {
           let button = UIButton(type: .system)
           button.backgroundColor = UIColor.rgb(red: 89, green: 156, blue: 120)
           button.layer.cornerRadius = 10
           let font = UIFont.systemFont(ofSize: 16)
           let attributedTitle = NSMutableAttributedString(string:
           "Dail Number ", attributes: [NSAttributedString.Key.foregroundColor:
               UIColor.white, NSAttributedString.Key.font : font ])
           button.addTarget(self, action: #selector(button2SignIn), for: .touchUpInside)
           button.setAttributedTitle(attributedTitle, for: .normal)
           return button
       }()
       
    //MARK: - SCROLLVIEW INIT
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .cyan
        v.frame = v.bounds
        print("\(v.frame)......frame....")
        v.autoresizingMask = .flexibleHeight
        v.bounces = true
        v.showsHorizontalScrollIndicator = true
        v.contentSize = CGSize(width: 300, height: 1000)
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        print("\(scrollView.frame).......frame....")
        //MARK: SCROLLVIEW SETTING
        //scrollView.contentSize = contentViewSize
         print("\(scrollView.contentSize)...........")
        scrollView.frame = view.bounds
         print("\(scrollView.contentSize)...........")
        //scrollView.contentSize = contentViewSize
         print("\(scrollView.contentSize)...........")
        scrollView.alwaysBounceHorizontal = true
        
        
       // var contentWidth = scrollView.contentSize.width
       // var contentHeight = scrollView.contentSize.height
       // scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
        //scrollView.contentSize = CGSize(width: 300, height: 1050)
        // add the scroll view to self.view
        //MARK: - ADD THE SCROLLVIEW TO SCROLLVIEW
        view.addSubview(scrollView)
        
        //MARK: - SCROLLVIEW CONSTRAINTS
        // constrain the scroll view to 8-pts on each side
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        
      
       // scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //MARK: CONTAINERVIEW 1
        // add labelOne to the scroll view
        scrollView.addSubview(containerView1)
        
       
        // scrollView.contentSize = containerView2.bounds.size
        //constrain labelOne to left & top with 16-pts padding
        // this also defines the left & top of the scroll content
        containerView1.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        //containerView1.homeAnchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, right: scrollView.rightAnchor, paddingTop: 16, paddingLeft: 16, //paddingRight: 16, width: view.frame.width, height: 400)
        
        containerView1.homeAnchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingRight: -8, width: view.frame.width - 10, height: 300)
        
        //MARK: CONTAINERVIEW 2
        
        scrollView.addSubview(containerView2)
        
        containerView2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
       // containerView2.homeAnchor(top: containerView1.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, //paddingTop: 16, paddingLeft: 16, paddingRight: 16, width: view.frame.width, height: 400)
        
        containerView2.homeAnchor(top: containerView1.bottomAnchor, left: view.leftAnchor,right: view.rightAnchor, paddingTop: 16, paddingLeft: 8, paddingRight: -8, width: view.frame.width - 10, height: 300)
        
        //MARK: CONTAINERVIEW 3
        
     /*     scrollView.addSubview(containerView3)
              
              containerView3.centerXAnchor.constraint(equalTo: view.centerXAnchor)
             // containerView2.homeAnchor(top: containerView1.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, //paddingTop: 16, paddingLeft: 16, paddingRight: 16, width: view.frame.width, height: 400)
              
        containerView3.homeAnchor(top: containerView2.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 8, paddingRight: -8, width: view.frame.width - 10,  height: 300)
         */
        print("\(scrollView.frame).....frame.....last")
        configureViewComponents()
       // let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        //layout.scrollDirection = uicollectionv
        //let collectionView = uicollectionviewsc
    }
    
    
    
    //MARK: - Selectors OBJECTIVE C CODES CLICK BUTTON
    @objc func showSearchBar() {
        print(123)
    }
    
    @objc func button1SignIn(){
            print("clicked me")
    }
    
    @objc func button2SignIn(){
            print("clicked me")
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
 
 */
    
    /*
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


*/

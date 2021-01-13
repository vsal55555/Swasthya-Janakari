//
//  DoctorsCell.swift
//  Swasthya_Janakari
//
//  Created by macbook on 11/25/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class DoctorsCell: UITableViewCell {
    
    
    let alert = Alerts()
    
    let mailIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "email")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let phoneIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "call_icon")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let emailLabel: UILabel = {
          let label = UILabel()
          label.textColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
          label.font = UIFont.systemFont(ofSize: 14)
          return label
      }()
    
    let callButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
        button.layer.cornerRadius = 20
        let font = UIFont.systemFont(ofSize: 16)
        let attributedTitle = NSMutableAttributedString(string:
        "कल गनुहोस्", attributes: [NSAttributedString.Key.foregroundColor:
            UIColor.white, NSAttributedString.Key.font : font ])
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black, radius: 2.0, opacity: 0.35)
        return button
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    var doctorsImageView = UIImageView()
    let doctorNameLabel = UILabel()
    var doctorField = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(doctorsImageView)
        addSubview(doctorNameLabel)
        addSubview(doctorField)
        addSubview(mailIcon)
        addSubview(emailLabel)
        addSubview(phoneIcon)
        addSubview(phoneLabel)
        addSubview(callButton)
        
        configureImageView()
       // configureButtom()
        setImageConstraints()
        setDoctorNameLabelConstraints()
        setDoctorFieldLabelConstraint()
        setmailconConstraint()
        setemailLabelConstraint()
        setphoneIconConstraint()
        setphoneLabelConstraint()
        setcallButtonConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
    func set(doctorVCmodel: doctorVCmodel) {
        //let urlString = newsinfo.image
        //let url = URL(string: urlString)
        let urlString = doctorVCmodel.image
        let url = URL(string: urlString)
        doctorsImageView.downloaded(from: url!)
        doctorNameLabel.text = doctorVCmodel.name
        doctorNameLabel.textColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
        doctorField.text = doctorVCmodel.specialist
        doctorField.textColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
        emailLabel.text = doctorVCmodel.email
        phoneLabel.text = doctorVCmodel.mobile
        callButton.addTarget(self, action: #selector(button1SignIn), for: .touchUpInside)
    }
    
    
    
    @objc func button1SignIn(){
        let offsetIndex1: String.Index = phoneLabel.text!.index(phoneLabel.text!.startIndex, offsetBy: 05)
        let myNumber = phoneLabel.text!.substring(from: offsetIndex1)
        self.makePhoneCall(phoneNumber: myNumber)
      }
    
    func makePhoneCall(phoneNumber: String) {

        if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {

            let alert = UIAlertController(title: ("Do you want to Call " + phoneNumber + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            //vc.present(alert, animated: true, completion: nil)
          //alert.present(DoctorVC(), animated: true, completion: nil)
          DispatchQueue.main.async {
         UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
         }    }
    }
    
    func configureImageView() {
        doctorsImageView.clipsToBounds = true
        doctorsImageView.layer.cornerRadius = 1
    }
   
    func configureButtom() {
        //callButton.tintColor = .white
        //callButton.backgroundColor = .init(red: 0.00, green: 0.24, blue: 0.12, alpha: 1.00)
        callButton.clipsToBounds = true
        //callButton.layer.cornerRadius = 12
    }
    

    
    func setImageConstraints() {
        doctorsImageView.translatesAutoresizingMaskIntoConstraints = false
        doctorsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 08).isActive = true
        doctorsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 08).isActive = true
        doctorsImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        doctorsImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
         //doctorsImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        //tableTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setDoctorNameLabelConstraints() {
          doctorNameLabel.translatesAutoresizingMaskIntoConstraints = false
          doctorNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
          doctorNameLabel.leadingAnchor.constraint(equalTo: doctorsImageView.trailingAnchor, constant: 16).isActive = true
          doctorNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
       // tableHeadTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //tableHeadTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    func setDoctorFieldLabelConstraint() {
        doctorField.translatesAutoresizingMaskIntoConstraints = false
        doctorField.topAnchor.constraint(equalTo: doctorNameLabel.bottomAnchor, constant: 08).isActive = true
        doctorField.leadingAnchor.constraint(equalTo: doctorsImageView.trailingAnchor, constant: 16).isActive = true
        doctorField.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setmailconConstraint() {
        mailIcon.translatesAutoresizingMaskIntoConstraints = false
        mailIcon.topAnchor.constraint(equalTo: doctorField.bottomAnchor, constant: 08).isActive = true
        mailIcon.leadingAnchor.constraint(equalTo: doctorsImageView.trailingAnchor, constant: 16).isActive = true
        mailIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        mailIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
   
    func setemailLabelConstraint() {
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.topAnchor.constraint(equalTo: doctorField.bottomAnchor, constant: 08).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: mailIcon.trailingAnchor, constant: 08).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
   
    func setphoneIconConstraint() {
        phoneIcon.translatesAutoresizingMaskIntoConstraints = false
        phoneIcon.topAnchor.constraint(equalTo: doctorsImageView.bottomAnchor, constant: 16).isActive = true
        phoneIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        phoneIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        phoneIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
   
    func setphoneLabelConstraint() {
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.topAnchor.constraint(equalTo: doctorsImageView.bottomAnchor, constant: 16).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 08).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
   
    func setcallButtonConstraint() {
        callButton.translatesAutoresizingMaskIntoConstraints = false
        callButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -08).isActive = true
        callButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        callButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        callButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
}




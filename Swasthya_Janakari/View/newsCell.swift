//
//  newsCell.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/4/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit


class newsCell: UITableViewCell {
    
    //var tableImageView = UIImageView()
    
    var tableHeadTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.sizeToFit()
        //label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    var tableTailTitleLabel: UILabel = {
           let label = UILabel()
           label.numberOfLines = 1
           label.sizeToFit()
           //label.adjustsFontSizeToFitWidth = true
           label.font = UIFont.systemFont(ofSize: 17)
           return label
       }()
    
    let tableImageView: UIImageView = {
              let iv = UIImageView()
        iv.contentMode = .scaleAspectFill//.scaleAspectFill
              iv.clipsToBounds = true
              return iv
          }()
    
    var sourceTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(tableImageView)
        addSubview(tableHeadTitleLabel)
        addSubview(tableTailTitleLabel)
        addSubview(sourceTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setHeadTitleLabelConstraints()
        setTailTitleLabelConstraint()
        setSourceTitleLabelConstraint()
    }
    
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(newsinfo: newsInfo) {
        
        let urlString = newsinfo.image
        
        if urlString == nil {
            tableImageView.image  = UIImage(named: "covid")
        } else {
            let url = URL(string: urlString!)
            tableImageView.downloaded(from: url!)
        }
        tableHeadTitleLabel.text = newsinfo.title
        tableTailTitleLabel.text = String(newsinfo.content.filter { !"<h4><p></p><h1 itemprop=\"headline\"></h4>&nbsp;&nbsp;".contains($0) })
        sourceTitleLabel.text = newsinfo.source
    }
    
    func configureImageView() {
        tableImageView.layer.cornerRadius = 10
        tableImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        sourceTitleLabel.textColor = UIColor.gray
       
    }
    
    func setImageConstraints() {
        tableImageView.translatesAutoresizingMaskIntoConstraints = false
        tableImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tableImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -58).isActive = true
        tableImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        tableImageView.widthAnchor.constraint(equalTo: tableImageView.heightAnchor, multiplier: 1.8).isActive = true
    }
    
    func setHeadTitleLabelConstraints() {
          tableHeadTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableHeadTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableHeadTitleLabel.leadingAnchor.constraint(equalTo: tableImageView.trailingAnchor, constant: 08).isActive = true
          //    tableHeadTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tableHeadTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    func setTailTitleLabelConstraint() {
        tableTailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableTailTitleLabel.topAnchor.constraint(equalTo: tableHeadTitleLabel.bottomAnchor, constant: 16).isActive = true
        tableTailTitleLabel.leadingAnchor.constraint(equalTo: tableImageView.trailingAnchor, constant: 08).isActive = true
      //  tableTailTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tableTailTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setSourceTitleLabelConstraint() {
        sourceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        sourceTitleLabel.leadingAnchor.constraint(equalTo: tableImageView.trailingAnchor, constant: 08).isActive = true
        sourceTitleLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        sourceTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        
        
         guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }

}
//guard let url = URL(string: link) else { return }

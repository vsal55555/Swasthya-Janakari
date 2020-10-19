//
//  newsCell.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/4/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class newsCell: UITableViewCell {
    
    var tableImageView = UIImageView()
    var tableHeadTitleLabel = UILabel()
    var tableTailTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(tableImageView)
        addSubview(tableHeadTitleLabel)
        addSubview(tableTailTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setHeadTitleLabelConstraints()
        setTailTitleLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(newsinfo: newsInfo) {
        
        let urlString = newsinfo.image
        let url = URL(string: urlString)
      
        tableImageView.downloaded(from: url!)
        tableHeadTitleLabel.text = newsinfo.title
        tableTailTitleLabel.text = newsinfo.content
    }
    
    func configureImageView() {
        tableImageView.layer.cornerRadius = 10
        tableImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        tableHeadTitleLabel.backgroundColor = .green
        tableTailTitleLabel.backgroundColor = .systemPink
        tableHeadTitleLabel.numberOfLines = 0
        tableTailTitleLabel.numberOfLines = 0
    }
    
    func setImageConstraints() {
        tableImageView.translatesAutoresizingMaskIntoConstraints = false
        tableImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tableImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        tableImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        tableImageView.widthAnchor.constraint(equalTo: tableImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setHeadTitleLabelConstraints() {
          tableHeadTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableHeadTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableHeadTitleLabel.leadingAnchor.constraint(equalTo: tableImageView.trailingAnchor, constant: 20).isActive = true
              tableHeadTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tableHeadTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    func setTailTitleLabelConstraint() {
        tableTailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableTailTitleLabel.topAnchor.constraint(equalTo: tableHeadTitleLabel.bottomAnchor, constant: 20).isActive = true
        tableTailTitleLabel.leadingAnchor.constraint(equalTo: tableImageView.trailingAnchor, constant: 20).isActive = true
        tableTailTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tableTailTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
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

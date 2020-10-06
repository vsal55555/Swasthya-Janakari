//
//  cellChartVCCollectionViewCell.swift
//  PokedexMVC
//
//  Created by macbook on 10/2/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class cellChartVCCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cellChartVCCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "cellChartVCCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .link
    }

}

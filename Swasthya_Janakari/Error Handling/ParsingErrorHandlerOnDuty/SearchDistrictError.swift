//
//  SearchDistrictError.swift
//  Swasthya_Janakari
//
//  Created by macbook on 11/11/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import Foundation

struct SearchDistrict: Decodable {
    
    let id: String
    let province: String
    let title: String
    let title_np: String
}


enum ErrorsToThrow: Error {
case nothingFound
}

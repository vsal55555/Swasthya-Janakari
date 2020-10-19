//
//  RequestHelper.swift
//  Swasthya Janakari
//
//  Created by macbook on 10/7/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import Foundation
import UIKit

struct RequestHelper {
    static let path = Bundle.main.path(forResource: "Config", ofType: "plist")
    static let config = NSDictionary(contentsOfFile: path!)
    static let baseURLString = config!["serverURL"] as! String
    private static let baseSignUpUrl = config!["signUp"] as! String
    
   
   
}


   

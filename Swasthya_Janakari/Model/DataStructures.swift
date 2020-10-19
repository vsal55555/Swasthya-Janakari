//
//  DataStructures.swift
//  Remittance_Module
//
//  Created by macbook on 10/4/20.
//  Copyright © 2020 Edheba. All rights reserved.
//

import Foundation


//MARK: -CONTAINS SUCCESS OR FAILURE CASES FOR VERFICATION CHECK



struct myResult: Codable {
    let status: String
    let Id: Int
    let message: String
    
}
 

struct covid: Codable {
   let karnali_tested: String
   let karnali_affected: String
   let karnali_recovered: String
   let karnali_death: String
   let nepal_tested: String
   let nepal_affected: String
   let nepal_recovered: String
   let nepal_death: String
   let world_tested: String
   let world_affected: String
   let world_recovered: String
   let world_death: String
}

struct homeCell: Decodable {
     let karnali_affected: String
     let karnali_recovered: String
     let karnali_death: String
}

struct upperTitleCell: Decodable {
    let karnali_tested: String
    let karnali_recovered: String
    let karnali_death: String
}

struct upperSquareTitleCell: Decodable {
    let nepal_tested: String
    let nepal_affected: String
    let nepal_recovered: String
    let nepal_death: String
}


struct lowerSquareTitleCell: Decodable {
    let world_tested: String
    let world_affected: String
    let world_recovered: String
    let world_death: String
}


struct Post: Decodable {
    let userId: Int!
    let id: Int!
    let title: String!
    let body: String!
}


struct Response: Decodable {
    let results : MyResult
    let status : String
}


struct MyResult: Decodable {
  
    let sunrise : String
  let sunset : String
  let solar_noon : String
   let day_length : String
  let civil_twilight_begin : String
  let civil_twilight_end : String
  let nautical_twilight_begin : String
  let nautical_twilight_end : String
  let astronomical_twilight_begin : String
  let astronomical_twilight_end : String
}

//
//  VerifyAPI.swift
//  Swasthya Janakari
//
//  Created by macbook on 10/7/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import Foundation

struct VerifyAPI {
   // static let path = Bundle.main.path(forResource: "Config", ofType: "plist")
    //   static let config = NSDictionary(contentsOfFile: path!)
     //  private static let baseURLString = config!["serverUrl"] as! String
       
       static func createRequest(_ path: String) {
           
         //  let urlPath = "\(baseURLString)/\(path)"
        /*
           var components = URLComponents(string: urlPath)!
           
           var queryItems = [URLQueryItem]()
           
           for (key, value) in parameters {
               let item = URLQueryItem(name: key, value: value)
               queryItems.append(item)
           }
           
           components.queryItems = queryItems
           
           let url = components.url!
           
 */
        
            let url = URL(string: path)
           var request = URLRequest(url: url!)
           //request.httpMethod = "POST"
           
           let session: URLSession = {
               let config = URLSessionConfiguration.default
               return URLSession(configuration: config)
           }()
           
              //let result = completionHandler(jsonData)
          // result = try JSONDecoder().decode(Response.self, from: jsonData)
          // print(result)
        
           let task = session.dataTask(with: request) { (data, response, error) in
               guard let jsonData = data, error == nil else {
                print("Something went wrong")
                return
               }
            do {
               //var result: Response?
               // result = try JSONDecoder().decode(Response.self, from: jsonData)
               // print(result)
            }catch {
                print("failed to convert \(error.localizedDescription)")
            }
           }
           task.resume()
       }
    
    }


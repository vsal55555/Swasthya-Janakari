//
//  AppDelegate.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 8/25/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var upperTitle: [upperTitleCell] = []
    var myArrayforUpperTitle = [String]()
    
    var upperSquareTitle: [upperSquareTitleCell] = []
    var myArrayforUpperSquareTitle = [String]()
    
    var lowerSquareTitle: [lowerSquareTitleCell] = []
    var myArrayforlowerSquareTitle = [String]()
    
    var homeSquareTitle: [homeCell] = []
    
    var myArrayfornumberupperTitleLabel1: String = ""
    var myArrayfornumberupperTitleLabel2: String = ""
    var myArrayfornumberupperTitleLabel3: String = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print("i'm in delegate difFinish Launching Options")
               
         /*
        createRequestforToken(url: RequestHelper.baseURLString, parameters: ["user": "ZS1kaGViYUB1bmxpbWl0", "pwd": "ODUyNDU2"], httpMethod: "POST", contentType: "application/x-www-form-urlencoded", accept: "application/json; charset=utf-8", header: "c3RhbmRhbG9uZSZtdW5jaGE%3D")
           */
        
        getData(completed: { data, data2, data3, data4  in
          
            print("fetching all the data")
            self.myArrayforUpperTitle.append(data[0].karnali_death)
            self.myArrayforUpperTitle.append(data[0].karnali_recovered)
            self.myArrayforUpperTitle.append(data[0].karnali_tested)
            
            self.myArrayforUpperSquareTitle.append(data2[0].nepal_affected)
            self.myArrayforUpperSquareTitle.append(data2[0].nepal_death)
            self.myArrayforUpperSquareTitle.append(data2[0].nepal_tested)
            self.myArrayforUpperSquareTitle.append(data2[0].nepal_recovered)
            
            self.myArrayforlowerSquareTitle.append(data3[0].world_affected)
            self.myArrayforlowerSquareTitle.append(data3[0].world_death)
            self.myArrayforlowerSquareTitle.append(data3[0].world_tested)
            self.myArrayforlowerSquareTitle.append(data3[0].world_recovered)
            
            self.myArrayfornumberupperTitleLabel1 = data4[0].karnali_affected
            self.myArrayfornumberupperTitleLabel2 = data4[0].karnali_death
            self.myArrayfornumberupperTitleLabel3 = data4[0].karnali_recovered
          print("fetched all data")
          //  print("\(self.myArrayfornumberupperTitleLabel1)")
           // print("\(self.myArrayfornumberupperTitleLabel2)")
            //print("\(self.myArrayfornumberupperTitleLabel3)")
        })
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
    func getData(completed: @escaping ([upperTitleCell], [upperSquareTitleCell], [lowerSquareTitleCell], [homeCell]) -> ()) {
        
        print("*****************task is starting******************")
        let url = URL(string: "http://covid.hostingofprologic.com/api/statics/listby")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                //var result = [upperTitleCell]()
                do {
                     self.homeSquareTitle = try JSONDecoder().decode([homeCell].self, from: data!)
                    self.upperTitle = try JSONDecoder().decode([upperTitleCell].self, from: data!)
                    self.upperSquareTitle = try JSONDecoder().decode([upperSquareTitleCell].self, from: data!)
                    self.lowerSquareTitle = try JSONDecoder().decode([lowerSquareTitleCell].self, from: data!)
                   
                    DispatchQueue.main.async {
                        completed(self.upperTitle, self.upperSquareTitle, self.lowerSquareTitle, self.homeSquareTitle)
                    }
                } catch {
                        print("Json Error")
                }
            }
        }.resume()
        print("*****************task ended******************")
    }
}



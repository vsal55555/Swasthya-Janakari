//
//  SearchbyDistrictViewModel.swift
//  Swasthya_Janakari
//
//  Created by macbook on 11/11/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import Foundation


class SearchbyDistrictViewModel: NSObject, URLSessionDelegate {
    
    
    let url = "http://covid.hostingofprologic.com/api/district/list"
    var delegate: URLSessionDelegate?
    let httpMethod = "GET"
    
    lazy var yourDataArrayUsedInTheSourceofDistrictPicker: [String] = {
    [unowned self] in
    return ["try", "later"]
    }()
    
    var yourDataArrayUsedInTheSourceofDistrictPickerID = [String]()
    
    
       func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
                     
            print("****************certificate signed*********************")
            //Trust the certificate even if not valid
            let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(.useCredential, urlCredential)
            }
    
      //MARK: -REQUEST PAYLOAD
       func createRequesttoSearchDistrictID(completionHandler: @escaping (Result<[SearchDistrict], ErrorsToThrow>) -> Void){
              
              //MARK: -HTTP URL & PARAMETER INIT
                  let finalurl = URL(string: url)!
                  var request = URLRequest(url: finalurl)
                  request.httpMethod = httpMethod
        
                  let session: URLSession = {
                  let config = URLSessionConfiguration.default
                  return URLSession(configuration: config, delegate: SearchbyDistrictViewModel(), delegateQueue: nil)}()
      
                  let task = session.dataTask(with: request) { (data, response, error) in
                    
                    
                    if let response = response as? HTTPURLResponse {
                        print("*****************Enter to response *********************")
                        
                        
                        //MARK: -CHECK THE HTTPURL RESPONSE HEADER
                        if (response.statusCode == 200) {
                            print("I'm in 200 block. Return to login Screen")
                            do {
                                guard let data = data else {return}
                                var myData:Int?
                                let logindata = try JSONDecoder().decode([SearchDistrict].self, from: data)
                                //self.yourDataArrayUsedInTheSourceofDistrictPicker = logindata
                                //print(logindata)
                                myData = logindata.count
                                self.yourDataArrayUsedInTheSourceofDistrictPicker.removeAll()
                                for i in myData! {
                                    let tobeAppendedData = logindata[i].title_np
                                    let tobeAppendedID = logindata[i].id
                                    self.yourDataArrayUsedInTheSourceofDistrictPicker.append(tobeAppendedData)
                                    self.yourDataArrayUsedInTheSourceofDistrictPickerID.append(tobeAppendedID)
                                }
                                DispatchQueue.main.async {
                                    completionHandler(.success(logindata))
                                }
                            } catch {
                                debugPrint("********i'm in debug error************\(error)")
                                print("***********i'm in error*********\(error)")
                                print("failed to convert \(error.localizedDescription)")
                            }
                        }
                        if (response.statusCode) == 405 {
                            print("I'm in 405 block. Return to login Screen")
                            do {
                                guard let data = data else {return}
                                
                             //   let kycError = try JSONDecoder().decode(KYCverifyError.self, from: data)
                                DispatchQueue.main.async {
                                    completionHandler(.failure(.nothingFound))
                                }
                            } catch {
                                debugPrint("********i'm in debug error************\(error)")
                                print("***********i'm in error*********\(error)")
                                print("failed to convert \(error.localizedDescription)")
                            }
                            
                        }
                     }
 
                    if let error = error {
                        print("*****************Enter to url error *********************")
                        print("error:", error)
                       
                        return
                    }
                    
                    do {
                        print("******************* Enter to Data do block******************")
                        guard let data = data else { return }
                        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else { return }
                        
                        print(json)
    
                    } catch {
                        print("*****************Enter to catch*********************")
                        print("error:", error)
                    }
        }
        
        task.resume()
        
        print("API call ended")
        
    }
    
}

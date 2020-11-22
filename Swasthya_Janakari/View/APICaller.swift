//
//  APICaller.swift
//  Swasthya_Janakari
//
//  Created by macbook on 10/29/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.

//mock the Data

import Foundation

class APICaller: NSObject, URLSessionDelegate {
    
    //var isPaginating = false
    
    var delegate: URLSessionDelegate?
    let httpMethod = "GET"
    var districtNewData = [SearchDistrictModel]()
    var districtOriginalData = [SearchDistrictModel]()
    var count = 0
    
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
    func createRequesttoFetchDataForPagination(url: String, completionHandler: @escaping (Result<[SearchDistrictModel], ErrorsToThrow>) -> Void) {
       // count = count + 1
       // print("**********\(count)*********")
        /*
        if pagination {
            isPaginating = true
        } */
        DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: {
            //MARK: -HTTP URL & PARAMETER INIT
            let finalurl = URL(string: url)!
            var request = URLRequest(url: finalurl)
            request.httpMethod = self.httpMethod
            
            let session: URLSession = {
                let config = URLSessionConfiguration.default
                return URLSession(configuration: config, delegate: APICaller(), delegateQueue: nil)}()
            
            let task = session.dataTask(with: request) { (data, response, error) in
                
                
                if let response = response as? HTTPURLResponse {
                    print("*****************Enter to response *********************")
                    
                    
                    //MARK: -CHECK THE HTTPURL RESPONSE HEADER
                    if (response.statusCode == 200) {
                        print("I'm in 200 block. Return to login Screen")
                        do {
                            guard let data = data else {return}
                            let logindata = try JSONDecoder().decode([SearchDistrictModel].self, from: data)
                            self.districtOriginalData = logindata
                            DispatchQueue.main.async {
                                completionHandler(.success(self.districtOriginalData))
                            /*    if pagination {
                                    self.isPaginating = false
                                }  */
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
        })
    }
    
}

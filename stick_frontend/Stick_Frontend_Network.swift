//
//  Stick_Frontend_Network.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/7/26.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation


class Network: ObservableObject{
    
    //@Published private var Memo: MemoApp
    
    func login (_ email: String, _ password: String, _ condition: ViewCondition){
        let url = URL(string: USER_API.LOGIN)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 15
        let dic: [String: String] = ["email": email, "password": password]
        let data = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if error != nil {
//                print("errror: " + error.debugDescription)
//            }
//            if let data = data, let dataString = String(data: data, encoding: .utf8) {
//                    print("Response data string:\n \(dataString)")
//                }
            
            do {
                      if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                           
                           // Print out entire dictionary
                        let data: NSDictionary = convertedJsonIntoDict["data"] as! NSDictionary
                           print(data["token"])
                           
                           // Get value by key
//                           let userId = convertedJsonIntoDict["data"]
//                           print(userId ?? "userId could not be read")
                           
                       }
            } catch let error as NSError {
                       print(error.localizedDescription)
             }
//            print(response ?? "bad")
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    print("aaa")
                    condition.login()
                    
//                    var props = Dictionary<HTTPCookiePropertyKey, Any>()
//                    props[HTTPCookiePropertyKey.name] = "cookie3"
//                    props[HTTPCookiePropertyKey.value] = "333"
//                    props[HTTPCookiePropertyKey.path] = "/"
//                    props[HTTPCookiePropertyKey.domain] = "jsquare.top"
//                    let cookie = HTTPCookie(properties: props)
                    
                    
                } else {
                    print("bbb")
                        //DispatchQueue.main.async {
                        //}

                }
            }
        }
        task.resume()
    }
    
    func signUp(_ email: String, _ username: String, _ password: String, _ condition: ViewCondition) {
        let url = URL(string: USER_API.REGISTER)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 15
        let dic: [String: String] = ["username": username, "email": email, "password": password]
        let data = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("errror: " + error.debugDescription)
            }
            print(response!)
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 200 {
                    print("aaa")
                    condition.signup()
                } else {
                    print("bbb")
                    
                }
            }
        }
        task.resume()
    }
    
    func logout(_ condition: ViewCondition) {
        let url = URL(string: USER_API.LOGOUT)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 15
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("errror: " + error.debugDescription)
            }
            print(response!)
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    print("aaa")
                    condition.login()
                } else {
                    print("bbb")
                }
            }
        }
        task.resume()
    }
}










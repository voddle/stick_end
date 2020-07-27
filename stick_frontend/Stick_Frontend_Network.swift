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
        let url = URL(string: "http://jsquare.top:31162/api/user/users/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 15
        let dic: [String: String] = ["email": email, "password": password]
        let data = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Tyep")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("errror: " + error.debugDescription)
            }
            //print(response ?? "bad")
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    print("aaa")
                    condition.login()
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
        let url = URL(string: "http://jsquare.top:31162/api/user/users/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 15
        let dic: [String: String] = ["username": username, "email": email, "password": password]
        let data = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Tyep")
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
}










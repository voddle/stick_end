//
//  Stick_Frontend_Network.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/7/26.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation
import Alamofire

class Network: ObservableObject{
    
    //@Published private var Memo: MemoApp
    
    func login (_ email: String, _ password: String, _ condition: ViewCondition){
        AF.request(USER_API.LOGIN, method: .post, parameters: ["email":email, "password":password], encoder: JSONParameterEncoder.default).responseJSON {
            response in
            let res = response.value as! NSDictionary
            let token = res["data"] as! NSDictionary
            
        }
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










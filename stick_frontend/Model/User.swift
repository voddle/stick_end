//
//  User.swift
//  stick_frontend
//
//  Created by 白家栋 on 2020/8/1.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation
import Alamofire

struct User {
    
    var User_id: Int = 0
    var Username: String = ""
    var Password: String = ""
    var Email: String = ""
    var Token: String = ""
    var Avatar: String = ""
    
    
     mutating func login (_ email: String, _ password: String){
        
        var id: Int = 0
        var name: String = ""
        var pass: String = ""
        var email: String = ""
        var avatar: String = ""
        var token: String = ""
        
        if self.Token == "" {
            
            AF.request(USER_API.LOGIN, method: .post, parameters: ["email":email, "password":password], encoder: JSONParameterEncoder.default).responseJSON {
                response in
                                let res = response.value as! NSDictionary
                                let data = res["data"] as! NSDictionary
                                id = data["user_id"] as! Int
                                name = data["username"] as! String
                                pass = data["password"] as! String
                                email = data["email"] as! String
                                avatar = data["avatar"] as! String
                                token = data["token"] as! String
            }
            self.User_id = id
            self.Username = name
            self.Password = pass
            self.Email = email
            self.Avatar = avatar
            self.Token = token
        } else {
            print("jajajadfadfa")
        }
    }
    
     mutating func register(_ username: String, _ email: String, _ password: String) {
        
        var id: Int = 0
        var name: String = ""
        var pass: String = ""
        var email: String = ""
        var avatar: String = ""
        var token: String = ""
        
        if self.Token == "" {
            
            AF.request(USER_API.REGISTER, method: .post, parameters: ["username": username, "email":email, "password":password], encoder: JSONParameterEncoder.default).responseJSON {
                response in
                                let res = response.value as! NSDictionary
                                let data = res["data"] as! NSDictionary
                                id = data["user_id"] as! Int
                                name = data["username"] as! String
                                pass = data["password"] as! String
                                email = data["email"] as! String
                                avatar = data["avatar"] as! String
                                token = data["token"] as! String
            }
            self.User_id = id
            self.Username = name
            self.Password = pass
            self.Email = email
            self.Avatar = avatar
            self.Token = token
        } else {
            print("adfaadfaadf")
        }
    }
    
     mutating func logout() {
        self.Token = ""
    }
}







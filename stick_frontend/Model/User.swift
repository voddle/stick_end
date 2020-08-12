//
//  User.swift
//  stick_frontend
//
//  Created by 白家栋 on 2020/8/1.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation
import Alamofire

class User {
    
    var User_id: Int = 0
    var Username: String = ""
    var Password: String = ""
    var Email: String = ""
    var Token: String = ""
    var Avatar: String = ""
    
    
     func login (_ email: String, _ password: String){
        if self.Token == "" {
            AF.request(USER_API.LOGIN, method: .post, parameters: ["email":email, "password":password], encoder: JSONParameterEncoder.default).responseJSON {
                response in
                let res = response.value as! NSDictionary
                let data = res["data"] as! NSDictionary
                self.User_id = data["user_id"] as! Int
                self.Username = data["username"] as! String
                self.Password = data["password"] as! String
                self.Email = data["email"] as! String
                self.Avatar = data["avatar"] as! String
                self.Token = data["token"] as! String
            }
            
        } else {
            print("jajajadfadfa")
        }
    }
    
     func register(_ username: String, _ email: String, _ password: String) {
        
        
        
        if self.Token == "" {
            AF.request(USER_API.REGISTER, method: .post, parameters: ["username": username, "email":email, "password":password], encoder: JSONParameterEncoder.default).responseJSON {
                response in
                let res = response.value as! NSDictionary
                let data = res["data"] as! NSDictionary
                self.User_id = data["user_id"] as! Int
                self.Username = data["username"] as! String
                self.Password = data["password"] as! String
                self.Email = data["email"] as! String
                self.Avatar = data["avatar"] as! String
                self.Token = data["token"] as! String
            }
            
        } else {
            print("adfaadfaadf")
        }
    }
    
     func logout() {
        self.Token = ""
    }
}







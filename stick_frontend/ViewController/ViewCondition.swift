//
//  isLogin.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/7/26.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation

class ViewCondition: ObservableObject {
    @Published var isLogin = true
    @Published var isSignup = true

    
    func login() {
        if self.isLogin {
            self.isLogin = false
        } else {
            self.isLogin = true
        }
        print(self.isLogin)
    }
    
    func signup() {
        if self.isSignup {
            self.isSignup = false
        } else {
            self.isSignup = true
        }
        print("sign upcondition \(self.isSignup)")
    }
    
}


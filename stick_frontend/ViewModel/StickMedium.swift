//
//  StickMedium.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/12.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

class StickMedium: ObservableObject {
    
    @Published private(set) var Stick: StickApp = StickApp()
    @Published private(set) var UserModel: User = User()
    
    
    var Sticks: Array<StickApp.Stick> {
        return Stick.sticks
    }
    
    func loadSticks() {
        Stick.getSticks()
    }
    
    func logout() {
        UserModel.logout()
    }
    
    func login(email: String, password: String) {
        UserModel.login(email, password)
    }
    
    func register(username: String, email: String, password: String) {
        UserModel.register(username, email, password)
    }
    
}

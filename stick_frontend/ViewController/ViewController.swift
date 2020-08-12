
//
//  Stick.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/1.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct ViewController: View {
    
    @ObservedObject var condition: ViewCondition
    @ObservedObject var StickViewModel: StickMedium
     
    var body: some View {
        ZStack {
            if condition.isLogin == true {
                ContentView(condition: condition, StickViewModel: StickMedium())
            } else {
                if condition.isSignup == true {
                    LoginView(condition: condition, StickViewModel: StickMedium())
                } else {
                    SignupView(condition: condition, StickViewModel: StickMedium())
                }
            }            //ContentView()
        }
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController(condition: ViewCondition(), StickViewModel: StickMedium())
    }
}

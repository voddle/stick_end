//
//  LoginView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/7/26.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var condition: ViewCondition
    @ObservedObject var Net: Network
    
    @State private var Email: String = ""
    @State private var Password: String = ""
    
    var body: some View {
        ZStack {
            /*NavigationView {
               NavigationLink(destination: SignupView(Net: Network())) {
                  Text("Press on me")
               }.buttonStyle(PlainButtonStyle())
            }*/
            
            VStack {
                Text("Stick")
                    .font(.largeTitle)
                .bold()
                    .padding(.top, 120)
                Spacer()
            }
            VStack {
                HStack {
                    Text("E-mail")
                        .bold()
                        //.font(.system(size: ))
                        .padding(.horizontal, 30)
                    Spacer()
                }
                TextField(" E-mail", text: $Email)
                    .overlay(Rectangle().stroke().foregroundColor(Color.black))
                .padding(.horizontal, 30)
                
                HStack {
                    Text("Password")
                        .bold()
                        //.font(.system(size: ))
                        .padding(.horizontal, 30)
                    Spacer()
                }
                .padding(.top)
                TextField(" Password", text: $Password)
                    .overlay(Rectangle().stroke().foregroundColor(Color.black))
                .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                
                HStack {
                    Spacer()
                Button (action: {
                    self.Net.login(self.Email, self.Password, self.condition)
                }, label: {Text("Login").bold()})
                .padding(5)
                .foregroundColor(Color.white)
                    .background(Rectangle())
                    .padding(.horizontal, 30)
                }
                .padding(.top)
                
                
                
                Button (action: {
                    self.condition.signup()
                }, label: {Text("Signup")})
                    .padding(5)
                    .foregroundColor(Color.white)
                        .background(Rectangle())
                    .opacity(0.9)
                    .padding(.top, 50)
            }
            .padding(.top)
            
            
        }
    }
}




struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(condition: ViewCondition(), Net: Network())
    }
}

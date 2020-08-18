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
    
    @ObservedObject var StickViewModel: StickMedium
    @State private var Email: String = ""
    @State private var Password: String = ""
    @State private var secure: Bool = true
    
    var body: some View {
        ZStack {
            
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
                    .padding(3)
                    .overlay(Rectangle().stroke().foregroundColor(Color.black))
                    .padding(.horizontal, 30)
                    .autocapitalization(UITextAutocapitalizationType.none)
                HStack {
                    Text("Password")
                        .bold()
                        //.font(.system(size: ))
                        .padding(.horizontal, 30)
                    Spacer()
                }
                .padding(.top)
                
                HStack {
                    if secure {
                        SecureField(" Password", text: $Password)
                            .padding(3)
                            .autocapitalization(UITextAutocapitalizationType.none)
                    } else {
                        TextField(" Password", text: $Password)
                            .padding(3)
                            .autocapitalization(UITextAutocapitalizationType.none)
                    }
                    Button (action: {
                        self.secure.toggle()
                    }) {
                        if secure{
                            Image(systemName: "eye")
                        } else {
                            Image(systemName: "eye.fill")
                        }
                    }.padding(.trailing, 10)
                        .foregroundColor(Color.black)
                }.overlay(Rectangle().stroke().foregroundColor(Color.black))
                    .padding(.horizontal, 30)
                
                HStack {
                    Button (action: {
                        self.StickViewModel.login(email: self.Email, password: self.Password)
                    }, label: {Text("Login").bold()})
                        .padding(5)
                        .foregroundColor(Color.white)
                        .background(Rectangle())
                        .padding(.horizontal, 30)
                }
                .padding(.top)
                
                //需要等待登陆返回信息的状态和动画
                
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
        LoginView(condition: ViewCondition(), StickViewModel: StickMedium())
    }
}


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
                    .padding(3)
                    .overlay(Rectangle().stroke().foregroundColor(Color.black))
                    .padding(.horizontal, 30)
                    .padding(.trailing, 50)
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
                            .overlay(Rectangle().stroke().foregroundColor(Color.black))
                            .padding(.leading, 30)
                            .padding(.trailing, 17)
                            .autocapitalization(UITextAutocapitalizationType.none)
                            .padding(.bottom, 30)
                        
                    } else {
                        TextField(" Password", text: $Password)
                            .padding(3)
                            .overlay(Rectangle().stroke().foregroundColor(Color.black))
                            .padding(.leading, 30)
                            .padding(.trailing, 17)
                            .autocapitalization(UITextAutocapitalizationType.none)
                            .padding(.bottom, 30)
                    }
                    Button (action: {
                        self.secure.toggle()
                    }) {
                        if secure{
                            Image(systemName: "eye")
                        } else {
                            Image(systemName: "eye.fill")
                        }
                    }.padding(.bottom, 30)
                        .padding(.trailing, 30)
                }
                    
                
                HStack {
                    Spacer()
                    Button (action: {
                        self.StickViewModel.login(email: self.Email, password: self.Password)
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
        LoginView(condition: ViewCondition(), StickViewModel: StickMedium())
    }
}


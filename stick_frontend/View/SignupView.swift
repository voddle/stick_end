//
//  SignupView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/7/26.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    
    @ObservedObject var condition: ViewCondition
    
    @ObservedObject var StickViewModel: StickMedium
    
    @State private var Email: String = ""
    @State private var Username: String = ""
    @State private var Password: String = ""
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("Signup")
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
                        .padding(.top, 10)
                    Spacer()
                }
                TextField(" E-mail", text: $Email)
                    .padding(3)
                    .overlay(Rectangle().stroke().foregroundColor(Color.black))
                    .padding(.horizontal, 30).autocapitalization(UITextAutocapitalizationType.none)
                
                HStack {
                    Text("Username")
                        .bold()
                        //.font(.system(size: ))
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
                    Spacer()
                }
                TextField(" Username", text: $Username)
                    .padding(3)
                    .overlay(Rectangle().stroke().foregroundColor(Color.black))
                    .padding(.horizontal, 30).autocapitalization(UITextAutocapitalizationType.none)
                
                HStack {
                    Text("Password")
                        .bold()
                        //.font(.system(size: ))
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
                    
                    Spacer()
                }
                TextField(" Password", text: $Password)
                    .padding(3)
                    .overlay(Rectangle().stroke().foregroundColor(Color.black))
                    .padding(.horizontal, 30).autocapitalization(UITextAutocapitalizationType.none)
                
                
                HStack {
                    Spacer()
                    Button (action: {
                        self.StickViewModel.register(username: self.Email, email: self.Username, password: self.Password)
                    }, label: {Text("Signup")                        .bold()
                    })
                        
                        .padding(5)
                        .foregroundColor(Color.white)
                        .background(Rectangle())
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
                    
                }
                .padding(.top)
                HStack {
                    Spacer()
                    Button (action: {
                        self.condition.signup()
                    }, label: {Text("Already have one").bold()
                    })
                        
                        .padding(.horizontal, 2)
                        .foregroundColor(Color.white)
                        .background(Rectangle())
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
                    
                }
                .padding(.top)
                
            }
            
            //swipeGesture()
            //gestrue trail
            
        }
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(condition: ViewCondition(), StickViewModel: StickMedium())
    }
}


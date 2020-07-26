//
//  SignupView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/7/26.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    
    @ObservedObject var Net: Network
    
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
                    .overlay(Rectangle().stroke().foregroundColor(Color.black))
                .padding(.horizontal, 30)
                
                HStack {
                    Text("Username")
                        .bold()
                        //.font(.system(size: ))
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
                    Spacer()
                }
                TextField(" Username", text: $Username)
                    .overlay(Rectangle().stroke().foregroundColor(Color.black))
                .padding(.horizontal, 30)
                
                HStack {
                    Text("Password")
                        .bold()
                        //.font(.system(size: ))
                        .padding(.horizontal, 30)
                    .padding(.top, 10)

                    Spacer()
                }
                TextField(" Password", text: $Password)
                    .overlay(Rectangle().stroke().foregroundColor(Color.black))
                .padding(.horizontal, 30)
                
                HStack {
                    Spacer()
                Button (action: {
                    self.Net.signUp(self.Email, self.Username, self.Password)
                }, label: {Text("Signup")                        .bold()
                    })
                    
                .padding(5)
                .foregroundColor(Color.white)
                    .background(Rectangle())
                    .padding(.horizontal, 30)
                    .padding(.top, 10)

                }
                .padding(.top)
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(Net: Network())
    }
}

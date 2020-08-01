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
                    self.Net.signUp(self.Email, self.Username, self.Password, self.condition)
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
        SignupView(condition: ViewCondition(),Net: Network())
    }
}



//MARK: - Add SwipeGesture to the SignupView
//struct swipeGesture: UIViewRepresentable {
//
//    func makeCoordinator() -> swipeGesture.Coordinator {
//
//        swipeGesture.Coordinator()
//
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<swipeGesture>) -> UIView {
//
//        let view = UIView()
//        view.backgroundColor = .clear
//        let left = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.left))
//        left.direction = .left
//
////        let right = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.right))
////        right.direction = .right
//
//        view.addGestureRecognizer(left)
//        //view.addGestureRecognizer(right)
//
//
//
//        return view
//
//    }
//
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<swipeGesture>) {
//
//    }
//
//    class Coordinator {
//        // OC？
//        @objc func left() {
//
//        }
//
////        @objc func right() {
////
////        }
//    }
//}


//
//  ContentView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/7/26.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Text("First View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
                }
                .tag(0)
            
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
            
            Text("Third View")
            .font(.title)
            .tabItem {
                VStack {
                    Image(systemName: "keyboard")
                    Text("Third")
                }
            }
            .tag(2)
            
            Text("Fourth View")
            .font(.title)
            .tabItem {
                VStack {
                    Image(systemName: "person.crop.circle")
                    Text("")
                }
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

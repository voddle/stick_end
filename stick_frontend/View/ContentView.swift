//
//  ContentView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/7/26.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var condition: ViewCondition
    @ObservedObject var StickViewModel: StickMedium
    
    @State private var selection = 0
 
    var body: some View {
        
        TabView(selection: $selection){

//            List {
//                ForEach () { item in
//
//                }
//            }
            BrowseView(StickViewModel: StickViewModel)
                //MARK: - Next step is creat model of sticks array, creat the list view here with Foreach(), finish the stickify, implement the infinite scroll function
            .font(.title)
            .tabItem {
                VStack {
                    Image(systemName: "magnifyingglass")
                    Text("Discover")
                }
            }
            .tag(0)

            ProfileView(condition: condition, StickViewModel: StickViewModel)
            .font(.title)
            .tabItem {
                VStack {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            }
            .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(condition: ViewCondition(), StickViewModel: StickMedium())
    }
}


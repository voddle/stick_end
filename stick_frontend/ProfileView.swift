//
//  ProfileView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/7/27.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var condition: ViewCondition
    @ObservedObject var Net: Network
    
    
    var body: some View {
        
        
        VStack {
            HStack {
            Text("Username")
                .font(.largeTitle)
                .bold()
                .padding()
                Spacer()
            }
            
            List {
                Text("something")
                .font(.title)
                .bold()
                    .padding(.horizontal, 5)
                    .background(RoundedRectangle(cornerRadius: 10).zIndex(-1).foregroundColor(Color.gray))
                Text("something")
                .font(.title)
                .bold()
                    .padding(.horizontal, 5)
                    .background(RoundedRectangle(cornerRadius: 10).zIndex(-1).foregroundColor(Color.gray))
                Text("something")
                .font(.title)
                .bold()
                    .padding(.horizontal, 5)
                    .background(RoundedRectangle(cornerRadius: 10).zIndex(-1).foregroundColor(Color.gray))
                Text("something")
                .font(.title)
                .bold()
                    .padding(.horizontal, 5)
                    .background(RoundedRectangle(cornerRadius: 10).zIndex(-1).foregroundColor(Color.gray))
                Text("something")
                .font(.title)
                .bold()
                    .padding(.horizontal, 5)
                    .background(RoundedRectangle(cornerRadius: 10).zIndex(-1).foregroundColor(Color.gray))
            }
        
            .listStyle(PlainListStyle())
            
            Spacer()
            
            HStack {
                Spacer()
                Button (action: {
                    self.Net.logout(self.condition)
                }, label: { Text("Logout").padding(50)})
                    
                    
            }
        }
        .onAppear {UITableView.appearance().separatorStyle = .none}
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(condition: ViewCondition(), Net: Network())
    }
}

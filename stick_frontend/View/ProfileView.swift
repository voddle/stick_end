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
    
    @State private var choose: Bool = false

    
    var body: some View {
        
        
        VStack {
            HStack {
            Text("Username")
                .font(.largeTitle)
                .bold()
                .padding()
                Spacer()
                Image(systemName: "person.crop.circle") // head image
                    .font(.largeTitle)
                .padding()
            }
            
            ScrollView {
                Stickify(Net: Network(), Choosen: $choose)
                Stickify(Net: Network(), Choosen: $choose)
                Stickify(Net: Network(), Choosen: $choose)
                Stickify(Net: Network(), Choosen: $choose)
                Stickify(Net: Network(), Choosen: $choose)
                Stickify(Net: Network(), Choosen: $choose)
                Stickify(Net: Network(), Choosen: $choose)
                Stickify(Net: Network(), Choosen: $choose)
                Stickify(Net: Network(), Choosen: $choose)
            }.animation(Animation.easeInOut(duration: 0.1))
            
            
            
            HStack {
                Spacer(minLength: 10)
                Button (action: {
                    self.Net.logout(self.condition)
                }, label: { Text("Logout").padding(.horizontal).padding(.bottom)})
                    
                    
            }
        }
        .onAppear {UITableView.appearance().separatorStyle = .none} // invisible the sperate line
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(condition: ViewCondition(), Net: Network())
    }
}

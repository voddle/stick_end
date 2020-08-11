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
    @ObservedObject var user: User
    @ObservedObject var stickApp: StickApp
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
                // TODO: 动态构造stick, 这里通过stickApp的sticks变量可以得到获取到的所有stick的信息
                // 遍历每一个sticks中的stick，将这个stick传入Stickify即得到了一个Stick的View，将这个stick的view放在ScrollView中即可
                // 这里之所以过不了编译是因为我不会写555
                () -> [Stickify] {
                    var stickyFy: [Stickify]
                    
                    for stick in stickApp.sticks {
                        
                    }
                    
                }
                
                
                Stickify(Net: Network(), Choosen: $choose)
                Stickify(Net: Network(), Choosen: $choose)
                Stickify(Net: Network(), Choosen: $choose)
                //                Stickify(Net: Network(), Choosen: $choose)
                //                Stickify(Net: Network(), Choosen: $choose)
                //                Stickify(Net: Network(), Choosen: $choose)
                //                Stickify(Net: Network(), Choosen: $choose)
                //                Stickify(Net: Network(), Choosen: $choose)
                //                Stickify(Net: Network(), Choosen: $choose)
            }.animation(Animation.easeInOut(duration: 0.1))
            
            
            
            HStack {
                Spacer(minLength: 10)
                Button (action: {
                    self.user.logout()
                }, label: { Text("Logout").padding(.horizontal).padding(.bottom)})
                
                
            }
        }
        .onAppear {UITableView.appearance().separatorStyle = .none} // invisible the sperate line
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(condition: ViewCondition(), user: User())
    }
}

//
//  BrowseView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/5.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct BrowseView: View {
    
    @ObservedObject var StickViewModel: StickMedium
    
    @State private var choose: Bool = false
    
    @State private var post_status: Bool = false
    
    var body: some View {
        VStack{
            HStack {
                Text("Browse")
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                    
                Spacer()
                Image(systemName: "square")
                    .font(.title)
                    .padding(.horizontal)
                    .padding(.top)
                    .onTapGesture {
                        //self.StickViewModel.loadSticks() //this is just temporarily
                        self.post_status.toggle()
                    }
                .sheet(isPresented: $post_status) {
                    PostView(StickViewModel: StickMedium())
                }
            }
            ScrollView {
                ForEach (StickViewModel.Sticks) {Stick in
                    Stickify(StickViewModel: StickMedium(), stick: Stick, Choosen: self.$choose)
                }
            }.animation(Animation.easeInOut(duration: 0.1))
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView(StickViewModel: StickMedium())
    }
}

//MARK: - Scrollview need change

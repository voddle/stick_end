//
//  BrowseView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/5.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct BrowseView: View {
    
    @State private var choose: Bool = false
    
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
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

//MARK: - Scrollview need change
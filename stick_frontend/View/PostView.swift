//
//  PostView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/15.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct PostView: View {
    
    @State private var Stick_Content: String = ""
    
    @ObservedObject var StickViewModel: StickMedium
    
    @State var tag: [TagApp.Tag] = []
    
    var body: some View {
        VStack {
            HStack {
                TextField("Please entre the content you want to post", text: $Stick_Content)
                    .padding(.leading)
                Spacer()
            }
            
            HStack {
                ForEach (tag) { Tag in
                    Text(Tag.Content)
                        .font(.caption)
                        .bold()
                        .padding(.horizontal)
                }
            }
            
            ScrollView(.horizontal) {
                ForEach (StickViewModel.Tags) { Tag in
                    Button (action: {self.tag.append(Tag)}) {
                        Text(Tag.Content)
                            .padding(.horizontal)
                    }
                }
            }
            
            
            
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(StickViewModel: StickMedium())
    }
}

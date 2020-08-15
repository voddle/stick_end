//
//  PostView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/15.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct PostView: View {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    @State private var Stick_Content: String = ""
    
    @ObservedObject var StickViewModel: StickMedium
    
    @State var tag: [TagApp.Tag] = []
    
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                Image(systemName: "square.and.arrow.up")
                    .padding()
                    .onTapGesture {
                        //post function
                }
            }
                HStack {
                    ForEach (tag) { Tag in
                        Text(Tag.Content)
                            .font(.caption)
                            .bold()
                            .padding(.leading, self.screenSize.width * 0.01)
                        .onTapGesture {
                            let index = self.tag.firstIndex(matching: Tag)! // The ! is in order to guarantee the index is an Int
                            self.tag.remove(at: index)
                        }
                    }
                    
                    Spacer()
                }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach (StickViewModel.Tags) { Tag in
                        Button (action: {self.tag.append(Tag)}) {
                            Text(Tag.Content)
                                .font(.caption)
                                .bold()
                                .foregroundColor(Color.black)
                        }.padding(.leading, self.screenSize.width * 0.005)
                    }
                }
            }
            
            HStack {
                TextField("Please entre the content you want to post", text: $Stick_Content)
                    .padding(.leading)
                Spacer()
            }
            .overlay(Rectangle().stroke().padding().foregroundColor(Color.black))
            
            Spacer()
            
            //MARK: - The PostView is hidden by swipe down gesture since it's a sheet
            
            //MARK: - I believe this component needs more code to realize the function of getting location, time, duration of stick, user_id (Maybe id the implicit func form the client)
            
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(StickViewModel: StickMedium())
    }
}

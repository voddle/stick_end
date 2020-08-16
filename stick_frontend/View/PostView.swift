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
    
    @State var Ano: Bool = false
    
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
                Text("1")
                    .font(.caption)
                    .foregroundColor(Color.clear)
                    ForEach (StickViewModel.Tags) { Tag in
//                        Text(Tag.Content)
//                            .font(.caption)
//                            .bold()
//                            .fixedSize(horizontal: false, vertical: true)
//                            .padding(.horizontal, self.screenSize.width * 0.01)
//                            .background(Color.gray)
//                            .cornerRadius(10)
//                            .padding(.leading, self.screenSize.width * 0.01)
//                            .onTapGesture {
//                                let index = self.tag.firstIndex(matching: Tag)! // The ! is in order to guarantee the index is an Int
//                                self.tag.remove(at: index)
//                    }
                        if Tag.Picked {
                        Button (action: {
                            //self.tag.remove(at: Tag.id) //MARK: problem
                            self.StickViewModel.invis(Index: Tag.id)
                        }) {
                            Group {
                                Text(Tag.Content)
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(Color.black).padding(.horizontal, self.screenSize.width * 0.01)
                                        .background(Color.gray)
                                    .cornerRadius(10)
                                .fixedSize(horizontal: false, vertical: true)
                            }
                        
                        }
                        .padding(.leading, self.screenSize.width * 0.01)
                        } else {
                            
                        }
                }
                Spacer()
            }
            
            Divider()
            
            ScrollView(.horizontal) {
                HStack {
                    Text("1")
                        .font(.caption)
                        .foregroundColor(Color.clear)
                    ForEach (StickViewModel.Tags) { Tag in
                        if !Tag.Picked {
                        Button (action: {
                            //self.tag.append(Tag)
                            self.StickViewModel.invis(Index: Tag.id)
                        }) {
                            Group {
                                Text(Tag.Content)
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(Color.black).padding(.horizontal, self.screenSize.width * 0.01)
                                        .background(Color.gray)
                                    .cornerRadius(10)
                                .fixedSize(horizontal: false, vertical: true)
                            }
                        
                        }
                        .padding(.leading, self.screenSize.width * 0.01)
                        .padding(.bottom, self.screenSize.width * 0.01)
                        } else {
                            
                        }
                    }
                }
            }
            
            Divider()
            
            HStack {
                Toggle(isOn: $Ano) {
                    HStack {
                        Spacer()
                        Text("Ano")
                    }
                }.padding(.horizontal)
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
        .background(Ano ? Color.gray : Color.white)
        .animation(Animation.easeInOut(duration: 0.1))
        
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(StickViewModel: StickMedium())
    }
}

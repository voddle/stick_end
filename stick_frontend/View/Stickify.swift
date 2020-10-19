//
//  Stickify.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/1.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct Stickify: View {
    
    // 这里我把stickify的构造改成了下面
    // 直接传入一个State变量stick, 为Stick类型, 包含stick的信息(创建者, 内容，位置，评论等等)。
    // 在构造这个stick的时候直接访问stick的属性即可(stick.Content, stick.User.Username blabla)
    @ObservedObject var StickViewModel: StickMedium
    
    @State var stick: StickApp.Stick  //命名错误，已经改了
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    @Binding var Choosen: Bool
    
    @State private var unfold: Bool = false
    
    @State private var comment: String = ""
    
    @State private var Content: String = ""
    
    
    var body: some View {
        
        
        VStack {
            
            Group {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .font(.title)
                    VStack (alignment: .leading){
                        Text("Username")
                            .font(.caption)
                            .bold()
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)//magic code, don't know how it work, but it stop Text() being truncated
                        Text("Profile")
                            .font(.caption)
                    }
                    Spacer()
                    Group{
                        VStack (alignment: .trailing){
                            
                            Text("From xxx")
                                .font(.caption)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            Text("XXX times ago")
                                .font(.caption)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                    }.padding(.trailing, self.screenSize.width * 0.01)
                    Group {
                        if unfold {
                            Image(systemName: "square.and.arrow.up")
                                .font(.caption)
                                .padding(.trailing, self.screenSize.width * 0.02)
                                .onTapGesture {
                                    self.unfold.toggle()
                            }
                        } else {
                            EmptyView()
                        }
                    }
                    .animation(Animation.easeInOut(duration: 0).delay(unfold ? 0.4 : 0))
                    //.padding(.leading, self.screenSize.width * 0.4)
                }
                .contentShape(Rectangle())
            }
            HStack {
                ForEach (stick.tag) {TAG in
                    Text(TAG.Content)
                }
                Spacer()
            }
            
            VStack {
                VStack {
                    HStack {
                        Text(stick.Content)
                            .lineLimit(999)
                            .font(.caption)
                        Spacer(minLength: 0)
                        
                    }
                        
                    .padding(.top, 5)
                    .frame(maxHeight: unfold ? nil : self.screenSize.height * 0.15)
                        //8.2. this part act really strange on iphone 11.
                        .animation(Animation.linear(duration: 0).delay(unfold ? 0.4 : 0))
                    
                    
                    Group {
                        if unfold {
                            VStack {
                                
                                HStack {
                                    Text("Comments").font(.callout).bold().padding(.leading, self.screenSize.width * 0.01)
                                    Spacer()
                                }
                                ForEach (stick.comments) { Comment in
                                    Group {
                                        HStack (alignment: .top){
                                            Image(systemName: "person.crop.circle").padding(.leading, self.screenSize.width * 0.01)
                                            Text("Username").font(.caption).bold()
                                            Text(Comment.content).font(.caption)
                                            Spacer()
                                            
                                        }.padding(.bottom, self.screenSize.height * 0.01)
                                    }
                                }
                                //demo of comment
                                //MARK: - this part should implement with ForEach to get all the comment
                            }.padding(.top)
                        } else {
                            EmptyView()
                        }
                    }
                    .animation(Animation.easeInOut(duration: 0).delay(unfold ? 0.2 : 0))
                    
                    
                    Spacer()
                }
                    .scrollable(unfold: unfold) // the length of content part should be limit so doesn't need to be limit, only the comment part should be scrollable
                
                // content part dosen't go on top, the Spacer() can't solve the problem
                
                HStack {
                    if unfold {
                        Group {
                            TextField("", text: $comment)
                                .overlay(Rectangle().stroke().foregroundColor(Color.black).padding(.vertical, self.screenSize.height * 0.001))
                                .padding(.horizontal)
                        }
                        .padding(.vertical)
                        
                        Spacer()
                        Group {
                            
                            if stick.liked {
                                Image(systemName: "hand.thumbsup.fill")
                                .padding(.leading, self.screenSize.height * 0.001)
                                .onTapGesture {
                                        self.StickViewModel.like(id: self.stick.id, index: self.StickViewModel.Sticks.firstIndex(matching: self.stick) ?? -1)
                                }// the like function
                            } else {
                                Image(systemName: "hand.thumbsup")
                                .padding(.leading, self.screenSize.height * 0.001)
                                .onTapGesture {
                                        self.StickViewModel.dislike(id: self.stick.id, index: self.StickViewModel.Sticks.firstIndex(matching: self.stick) ?? -1)
                                }// the like function
                            }
                            
                                
                            Text("\(stick.Thumb)")
                                .padding(.trailing,self.screenSize.height * 0.001)
                                .padding(.trailing)
                            Image(systemName: "star")
                                .padding(.vertical,self.screenSize.height * 0.001)
                                .padding(.trailing)
                            Image(systemName: "text.bubble")
                                .padding(.vertical,self.screenSize.height * 0.001)
                                .padding(.trailing)
                                .onTapGesture {
                                    self.StickViewModel.sendcomment(text: self.comment)//need more code
                            }
                        }
                        .font(.callout)
                        
                    } else {
                        EmptyView()
                    }
                }
                .padding(0)
                //.animation(Animation.easeInOut(duration: 0.1).delay(unfold ? 0.35 : 0))
            }
        }
            
        .padding(self.screenSize.width * 0.03)
        .overlay(Rectangle().stroke(lineWidth: 2).foregroundColor(Color.black).padding(self.screenSize.width * 0.02))
        .frame(height: unfold ? self.screenSize.height * 0.6 : self.screenSize.height * 0.15)
        .padding(.vertical, self.screenSize.height * 0.003)
        .onTapGesture {
            if self.unfold {
                
            } else {
                self.unfold.toggle()
            }
        }
        .animation(.spring())
        
        //                  .animation(Animation.easeInOut(duration: 0.35).delay(unfold ? 0 : 0.2))
    }
}

//MARK: - Cloud use an @State varible in browse view to control the fold of stick, and also add scale effect of other stick, the problem is the VStack and List, how to implement infinite scroll view, how to require stick content, how to sent comment, and how to post stick, need to make a list of those problem. 

//MARK: - Need add some paremeters in Stickify

//MARK: - Creat a animatable data to adjust the animation to achieve smooth animation in List

/*　MARK: - Due to the reconstruction of Stick model, the following features were required:
 1.thumbs count ---completed
 2.thumb function
 thumb animation required
 3.comments list ---- completed
 4.comment function */

//MARK: - How to record which Stick have been LIKED, I deem it should be stored on the server, a liked list, when responsing a get_stick request, match the requester and the liked list

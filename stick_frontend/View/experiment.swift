//
//  experiment.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/2.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct experiment: View {
    
          let screenSize: CGRect = UIScreen.main.bounds
          
          @State private var unfold: Bool = true
          
          @State private var comment: String = ""
          
          
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
                              }
                              //.padding(.leading, self.screenSize.width * 0.4)
                          }
                      }
                      HStack {
                          Text("#TAG#TAG#TAG")
                              .font(.caption)
                          Spacer()
                      }
                      
                      VStack {
                      
                          HStack {
                              Text("XXXXXXXXXXXXXXXXXXCONTENTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXCONTENTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXCONTENTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXCONTENTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXCONTENTXXXXXXXXXXXXXXXXXX")
                              .lineLimit(999)
                                  .font(.caption)
                              Spacer(minLength: 0)
                                  
                          }
                              .scrollable(unfold: unfold) // the length of content part should be limit so doesn't need to be limit, only the comment part should be scrollable
                          .padding(.top, 5)
                          .frame(maxHeight: unfold ? nil : self.screenSize.height * 0.15)
                              //8.2. this part act really strange on iphone 11.
                              .animation(Animation.linear(duration: unfold ? 0.1 : 0.05).delay(unfold ? 0.1 : 0))
                          
                          Spacer()
                          
                          // content part dosen't go on top, the Spacer() can't solve the problem
                          
                              HStack {
                                  if unfold {
                                      Group {
      //                                Image(systemName: "person.crop.circle")
      //                                    .padding(.horizontal)
      //                                    .font(.title)
                                          TextField("comment", text: $comment)
                                              .overlay(Rectangle().stroke().foregroundColor(Color.black))
                                              .padding(.horizontal)
                                      }
                                      .padding(.vertical)
                                      
                                      Spacer()
                                      Group {
                                          Image(systemName: "hand.thumbsup")
                                          Image(systemName: "star")
                                          Image(systemName: "text.bubble")
                                      }
                                      .padding(.vertical)
                                      .padding(.trailing)
                                  } else {
                                      EmptyView()
                                  }
                              }
                      .padding(0)
                              .animation(Animation.easeInOut(duration: 0.1).delay(unfold ? 0.3 : 0))
                      }
                  }
          
              .padding(self.screenSize.width * 0.03)
                  .overlay(Rectangle().stroke(lineWidth: 2).foregroundColor(Color.black).padding(self.screenSize.width * 0.02))
                  .frame(maxHeight: unfold ? self.screenSize.height * 0.6 : self.screenSize.height * 0.15)
                  .onTapGesture {
                      if self.unfold {
                          self.unfold = false
                      } else {
                          self.unfold = true
                      }
                  }
                  .animation(Animation.easeInOut(duration: 0.3).delay(unfold ? 0 : 0.1))
              }
}

struct experiment_Previews: PreviewProvider {
    static var previews: some View {
        experiment()
    }
}

//MARK: - need words limits

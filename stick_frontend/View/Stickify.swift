//
//  Stickify.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/1.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct Stickify: View {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack {
//            GeometryReader { geometry in
                Rectangle().stroke(lineWidth: 3).frame(width: self.screenSize.width * 0.95, height: self.screenSize.height * 0.15)
                 
            VStack {
                    HStack {
                        //User component
                        Group {
                            Image(systemName: "person.crop.circle").font(.largeTitle)
                            VStack (alignment: .leading){
                                Text("Username").lineLimit(1)
                                    .minimumScaleFactor(0.5)//magic code, don't know how it work, but it stop Text() being truncated
                                Text("Profile").font(.caption)
                            }
                            
                        }
                        
                        Rectangle().frame(width: self.screenSize.width * 0.38, height: self.screenSize.height * 0.04).foregroundColor(Color.white)
                        //占位用rect
                        
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
                    //}
                }//heading
                
                Text("contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent").padding(.horizontal, self.screenSize.width * 0.05)
            }
        }
    }
}

struct Stickify_Previews: PreviewProvider {
    static var previews: some View {
        Stickify()
    }
}

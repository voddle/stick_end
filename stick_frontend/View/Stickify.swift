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
            GeometryReader { geometry in
                Rectangle().stroke(lineWidth: 3).frame(width: self.screenSize.width * 0.95, height: self.screenSize.height * 0.15)
                 
//                VStack{
//                    HStack {
//                        Image(systemName: "person.crop.circle").font(.largeTitle)
//                        VStack {
//                            Text("Username")
//                            Text("Profile").font(.caption)
//                        }
//
//                    }
//                }
            }
        }
    }
}

struct Stickify_Previews: PreviewProvider {
    static var previews: some View {
        Stickify()
    }
}

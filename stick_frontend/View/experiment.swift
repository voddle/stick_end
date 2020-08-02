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
            
            HStack {
                Text("XXXXXXXXXXXXXXXXXXCONTENTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXCONTENTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXCONTENTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXCONTENTXXXXXXXXXXXXXX")
                //.lineLimit(2)
                    .font(.caption)
                Spacer(minLength: 0)
                    
            }
            .padding(.top, 5)
                //8.2. this part act really strange on iphone 11.
        }
    .padding(self.screenSize.width * 0.03)
        .overlay(Rectangle().stroke(lineWidth: 2).foregroundColor(Color.black).padding(self.screenSize.width * 0.02))
        .frame(maxHeight: self.screenSize.height * 0.15)
    }
}

struct experiment_Previews: PreviewProvider {
    static var previews: some View {
        experiment()
    }
}

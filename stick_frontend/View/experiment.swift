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
            HStack {
                Image(systemName: "person.crop.circle")
                    .font(.largeTitle)
                VStack (alignment: .leading){
                    Text("Username")
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
            HStack {
                Text("#TAG#TAG#TAG")
                    .font(.caption)
                Spacer()
            }
            
            Text("XXXXXXXXXXXXXXXXXXCONTENTXXXXXXXXXXXXXXXXXX")
                .font(.caption)
        }
    .padding(self.screenSize.width * 0.05)
        .overlay(Rectangle().stroke().foregroundColor(Color.black).padding(self.screenSize.width * 0.02))
    }
}

struct experiment_Previews: PreviewProvider {
    static var previews: some View {
        experiment()
    }
}

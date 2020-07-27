//
//  ProfileView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/7/27.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var condition: ViewCondition
    @ObservedObject var Net: Network
    
    var body: some View {
        Button (action: {
            self.Net.logout(self.condition)
        }, label: { Text("Logout")})
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(condition: ViewCondition(), Net: Network())
    }
}

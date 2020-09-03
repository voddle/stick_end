//
//  AvatarView.swift
//  stick_frontend
//
//  Created by 白家栋 on 2020/8/1.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct AvatarView: View {
    
    @ObservedObject var StickViewModel: StickMedium
    
    var body: some View {
        Image(StickViewModel.Avatar)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(StickViewModel: StickMedium())
    }
}

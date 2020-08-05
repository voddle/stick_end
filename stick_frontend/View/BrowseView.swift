//
//  BrowseView.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/5.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        ScrollView {
            Stickify()
            Stickify()
            Stickify()
            Stickify()
            Stickify()
            Stickify()
            Stickify()
        }.animation(Animation.easeInOut(duration: 0.1))
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

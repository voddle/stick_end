//
//  scroll.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/4.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

struct scroll: ViewModifier {
        
    var condition: Bool
    
    init (unfold: Bool) {
        condition = unfold
    }

    func body(content: Content) -> some View {
        ZStack {
            if condition {
                     ScrollView {
                        content
                    }
            } else {
                    content
            }
        }
    }
}

extension View {
    func scrollable(unfold: Bool) -> some View {
        self.modifier(scroll(unfold: unfold))
    }
}

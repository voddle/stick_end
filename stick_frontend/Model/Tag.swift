//
//  Tag.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/1.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation

struct Tag: Identifiable {
    let Content: String
    let id: String //used to be Tag_id
}

struct TagApp {
    let Tags: [Tag]
}

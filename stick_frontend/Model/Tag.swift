//
//  Tag.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/1.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation

struct TagApp {

struct Tag: Identifiable {
    var Content: String
    var id: Int
    var Picked: Bool = false
}
    
    let TagText: [String] = ["Food", "Mood", "News", "Trans", "Nothing"]
    
    var Tags: Array<Tag>
    
    init() {
        Tags = Array<Tag>()
        for index in 0 ..< TagText.count {
            Tags.append(Tag(Content: TagText[index], id: index))
        }
    }
    
    mutating func Invis(Index: Int){
        Tags[Index].Picked.toggle()
    }
    
    
    
}

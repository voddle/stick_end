//
//  Stick.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/1.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation

struct stickApp {

    private(set) var sticks: Array<stick>

    struct stick{
        let Stick_id: UUID
        let Creat_at: String
        let End_at: String
        var Is_ano: Bool
        var Thumb: Int
        let Location: String
        var Content: String
        let User_id: Int
        
    }

//    init() {
//        sticks = Array<stick>()
//        for stickIndex in 0 ..< 20 {
//            let body:URLResponse =
//            
//        }
//    }
}


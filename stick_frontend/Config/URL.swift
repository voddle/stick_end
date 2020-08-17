//
//  URL.swift
//  stick_frontend
//
//  Created by 白家栋 on 2020/8/1.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation

struct CONFIG {
    static let HOST = "http://39.99.211.12:31162"
}

struct USER_API {
    static let PREFIX = "/api/user/users"
    static let LOGIN = CONFIG.HOST + PREFIX + "/login"
    static let REGISTER = CONFIG.HOST + PREFIX + "/register"
    static let AVATAR = CONFIG.HOST + PREFIX + "/avatar"
    static let LOGOUT = CONFIG.HOST + PREFIX + "/logout"
}

struct STICK_API {
    static let PREFIX = "/api/stick/sticks"
    static let GET_STICKS = CONFIG.HOST + STICK_API.PREFIX + ""
    static let SEND_STICKS = CONFIG.HOST + STICK_API.PREFIX + ""
}

struct USER_STICK_API {
    static let PREFIX = "/api/userstick/users"
    
    static func GET_USER_STICKS_BY_ID(user_id: String) -> String {
        return CONFIG.HOST + USER_STICK_API.PREFIX + "/\(user_id)/sticks"
    }
    
    static func GET_USER_STICKS_BY_USERID_STICKID(user_id: String, stick_id: String) -> String {
        return CONFIG.HOST + USER_STICK_API.PREFIX + "/\(user_id)/sticks/\(stick_id)"
    }
}

struct LIKE_API {
    var a = 1
}

struct TAG_API {
    static let PREFIX = ""
    static let GET = CONFIG.HOST + PREFIX + ""
    static let SEND = CONFIG.HOST + PREFIX + ""
}

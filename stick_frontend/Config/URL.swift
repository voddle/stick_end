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

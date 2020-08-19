//
//  StickMedium.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/12.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import SwiftUI

class StickMedium: ObservableObject {
    
    @Published private(set) var Stick: StickApp = StickApp()
    @Published private(set) var UserModel: User = User()
    @Published private(set) var TagModel: TagApp = TagApp()
    @Published private(set) var LocationModel: Map = Map()
    
    
    
    
    var Sticks: Array<StickApp.Stick> {
        return Stick.sticks
    }
    
    var SelfSticks: Array<StickApp.Stick> {
        return Stick.selfSticks
    }
    
    var Tags: Array<TagApp.Tag> {
        return TagModel.Tags
    }
    
    var Username: String {
        return UserModel.Username
    }
    
    var Avatar: String {
        return UserModel.Avatar
    }
    
    func loadSticks() {
        Stick.getSticks()
    }
    
    func loadSelfSticks() {
        Stick.getSelfSticks()
    }
    
    func logout() {
        UserModel.logout()
    }
    
    func login(email: String, password: String) {
        UserModel.login(email, password)
    }
    
    func register(username: String, email: String, password: String) {
        UserModel.register(username, email, password)
    }
    
    func invis(Index: Int) {
        TagModel.Invis(Index: Index)
    }
    
    func sendStick(tags: [TagApp.Tag], ano: Bool, content: String, user_id: Int) {
        Stick.sendStick(tags: tags, ano: ano, content: content, user_id: user_id)
    }
    
}

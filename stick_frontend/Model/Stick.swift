//
//  Stick.swift
//  stick_frontend
//
//  Created by Deng mou on 2020/8/1.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation
import Alamofire


struct StickApp {
    
    

    struct Stick: Identifiable{
        var id: UUID //in order to conform the protocol: Identifiable to implement the ForEach on Sticks, the "User_id: was changed to the "id", So as other model
        let Creat_at: String
        let End_at: String
        var Is_ano: Bool
        var Thumb: Int
        let Location: String
        var Content: String
        var user: User  // 创建者的信息
        var tag: [TagApp.Tag] // 标签列表
        var comments: [Comment] // 评论列表
}

    
    private(set) var sticks: Array<Stick>
    
    private(set) var selfSticks: Array<Stick>
    
    
    // 获取全部
    mutating func getSticks(){
        var sticks: Array<Stick> = []
        let request = AF.request(STICK_API.GET_STICKS)
        
        // TODO: 貌似中文传过来会出现编码的问题，建议修复一下
        request.responseJSON() { (data) in
            let res = data.value as! NSDictionary
            let data = res["data"] as! Array<Stick>
            
            sticks = data
        }
        print(sticks)
        self.sticks.append(contentsOf: sticks)
    }
    
    mutating func getSelfSticks(){
        var selfSticks: Array<Stick> = []
        let request = AF.request(STICK_API.GET_SELF_STICKS)
        
        // TODO: 貌似中文传过来会出现编码的问题，建议修复一下
        request.responseJSON() { (data) in
            let res = data.value as! NSDictionary
            let data = res["data"] as! Array<Stick>
            
            selfSticks = data
        }
        print(selfSticks)
        self.selfSticks.append(contentsOf: selfSticks)
    }
    
    func sendStick(tags: [TagApp.Tag], ano: Bool, content: String, user_id: Int) {
        AF.request(STICK_API.SEND_STICKS, method: .post, parameters: ["tags": tags, "ano": ano, "content": content, "user_id": user_id]).responseJSON { response in
                let res = response.value as! NSDictionary
                let data = res["data"] as! NSDictionary
                let status_code = data["status code"] as! Int
            if status_code == 200 {
                print("POST SUCCESS")
            }
            
        }
        //need to make sure the Stick was sended successful or not
    }
    
    init(){
        sticks = Array<Stick>()
        //getSticks()
        selfSticks = Array<Stick>()
        //getSelfSticks()
    }
    
    
}

//MARK: - Post Stick function
//MARK: - Stick Like function, a http post request, send a empty body, server +1 thumb

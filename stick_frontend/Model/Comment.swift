//
//  Comment.swift
//  stick_frontend
//
//  Created by 白家栋 on 2020/8/11.
//  Copyright © 2020 Deng mou. All rights reserved.
//

import Foundation
import Alamofire


struct CommentModel {

    struct Comment: Identifiable {
        let commenter: User // 评论者的信息
        let id: UUID// changed from comment_id
        let stick_id: Int
        let content: String
    }


}

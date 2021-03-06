//
//  Adapter.swift
//  CNode
//
//  Created by fanhehe on 2017/4/9.
//  Copyright © 2017年 fanhehe. All rights reserved.
//

import Foundation
import SwiftyJSON

class Adapter {

}

class NetAdapter: Adapter {
    
    
    static func Topics (data: JSON) -> [Topic] {
        
        return data.flatMap { (index, item) in
            
            let tab = Tab[item["tab"].stringValue]
            
            let createAt = DFormat.toISOTime(string: item["create_at"].stringValue)
            let offsetTime = DFormat.toTimeOffset(string: item["create_at"].stringValue)
            
            return Topic(
                id: item["id"].stringValue,
                tab: tab,
                title: item["title"].stringValue,
                content: "",
                top: item["top"].boolValue,
                good: item["good"].boolValue,
                replyCount: item["reply_count"].intValue,
                visitCount: item["visit_count"].intValue,
                createAt: createAt,
                offsetTime: offsetTime,
                lastReplyAt: item["last_reply_at"].stringValue,
                loginName: item["author"]["loginname"].stringValue,
                avatarUrl: item["author"]["avatar_url"].stringValue,
                authorId: item["author_id"].stringValue
            )
        }
    }
    
}

extension NetAdapter {
    
//    enum Tab: String {
//        case job = "招聘"
//        case ask = "问答"
//        case all = "所有"
//        case good = "精华"
//        case share = "分享"
//    }
    
    fileprivate static let Tab = [
        "job": "工作",
        "all": "所有",
        "ask": "问答",
        "good": "精华",
        "share": "分享"
    ]
}

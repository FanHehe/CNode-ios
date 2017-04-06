//
//  ArticleShort.swift
//  CNode
//
//  Created by fanhehe on 2017/4/6.
//  Copyright © 2017年 fanhehe. All rights reserved.
//

import Foundation

class Author {
    var loginName: String? = "-";
    var avatarUrl: String? = "";
    
    init (_ loginName: String?, _ avatarUrl: String?) {
        self.loginName = loginName;
        self.avatarUrl = avatarUrl;
    }
    init (options: [String: String]?) {
        self.loginName = options?["loginName"];
        self.avatarUrl = options?["avatarUrl"];
    }
    
}

public class ArticleShort {
    
    var id: String? = "0";
    var tab: String? = "ask";
    var title: String? = "-";
    var content: String? = "-";
    var top: Bool? = false;
    var good: Bool? = false;
    
    var replyCount: Int? = 1;
    var visitCount: Int? = 1;
    
    var createAt: String? = "-";
    var lastReplyAt: String? = "-";
    
    var author: Author?;
    var authorId: String? = "0";
    
    init (id: String, tab: String, title: String, content: String, top: Bool, good: Bool, replyCount: Int, visitCount: Int, createAt: String, lastReplyAt: String, loginName: String, avatarUrl: String, authorId: String) {
        self.id = id;
        self.tab = tab;
        self.title = title;
        self.content = content;
        self.top = top;
        self.good = good;
        self.replyCount = replyCount;
        self.visitCount = visitCount;
        self.createAt = createAt;
        self.lastReplyAt = lastReplyAt;
        self.author = Author(loginName, avatarUrl);
        self.authorId = authorId;
    }
    
    init (_ options: [String: Any?]) {
        let loginName = options["loginName"] as? String;
        let avatarUrl = options["avatarUrl"] as? String;
        
        self.id = options["id"] as? String;
        self.tab = options["tab"] as? String;
        self.title = options["title"] as? String;
        self.content = options["content"] as? String;
        self.top = options["top"] as? Bool;
        self.good = options["good"] as? Bool;
        self.replyCount = options["replyCount"] as? Int;
        self.visitCount = options["visitCount"] as? Int;
        self.createAt = options["createAt"] as? String;
        self.lastReplyAt = options["lastReplyAt"] as? String;
        self.author = Author(loginName, avatarUrl);
        self.authorId = options["authorId"] as? String;
    }
}

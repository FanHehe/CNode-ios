//
//  Formatter.swift
//  CNode
//
//  Created by fanhehe on 2017/4/10.
//  Copyright © 2017年 fanhehe. All rights reserved.
//

import Foundation

class Format {

}


class DFormat: Format{
    static var formatter = DateFormatter()
    
    enum dateFormat: String {
        case iso = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        case gmt = ""
        case dst = "yyyy-MM-dd HH:mm:ss"
    }
    static func toISOTime(string: String) -> String {
        formatter.locale = Locale.current
        formatter.dateFormat = dateFormat.iso.rawValue
        let date = formatter.date(from: string)
        formatter.dateFormat = dateFormat.dst.rawValue
        guard date != nil else { return "" }
        return formatter.string(from: date!)
    }
    
    
    static func toTimeOffset(string: String) -> String {
        formatter.dateFormat = dateFormat.iso.rawValue
        let date = formatter.date(from: string)
        let now = Date()
        let offset = now.timeIntervalSince1970 - (date?.timeIntervalSince1970)!
        return self.offsetToString(offset: offset)
    }
    
    static func offsetToString(offset: Double) -> String {
        return self.offsetToString(offset: Int(offset))
    }
    
    static func offsetToString(offset: Int) -> String {
        if offset / 60 == 0 { return "\(offset)秒前" }
        if offset / 60 / 60 == 0 { return "\(offset/60)分钟前" }
        if offset / 60 / 60 / 24 == 0 { return "\(offset/60/60)小时前"}
        return "\(offset / 60 / 60 / 24)天前"
    }
}

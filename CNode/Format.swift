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
    static func getDateTime(string: String) -> String {
        formatter.locale = Locale.current
        formatter.dateFormat = dateFormat.iso.rawValue
        let date = formatter.date(from: string)
        formatter.dateFormat = dateFormat.dst.rawValue
        
        return formatter.string(from: date!)
    }
}

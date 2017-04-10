//
//  Fetch.swift
//  CNode
//
//  Created by fanhehe on 2017/4/9.
//  Copyright © 2017年 fanhehe. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

class Fetch {
    static let fetch = Fetch()
    static func get (_ url: String, callback: @escaping (_ data: JSON) -> ()) {
        Alamofire.request(url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    return
                }
                if let value = response.result.value {
                    let data = JSON(value)
                    return callback(data)
                }
        }
    }
    
    static func get (_ url: String, params: [String: String], callback: @escaping (_ data: JSON) -> ()) {
        Alamofire.request(url, method: .get, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    return
                }
                if let value = response.result.value {
                    let data = JSON(value)
                    return callback(data)
                }
        }
    }
    
    static func request(_ url: String, _ method: HTTPMethod, callback: (_ data: Any) -> ()) {
        
    }
}

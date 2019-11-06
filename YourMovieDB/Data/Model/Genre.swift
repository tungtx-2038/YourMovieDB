//
//  Genre.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/6/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import ObjectMapper

struct Genre: BaseModel {
    var id = 0
    var name = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}

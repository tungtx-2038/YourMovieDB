//
//  Country.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import ObjectMapper

struct Country: BaseModel {
    var iso = 0
    var name = ""
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        iso <- map["iso_639_1"]
        name <- map["name"]
    }
}

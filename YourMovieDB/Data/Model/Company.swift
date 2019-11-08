//
//  Company.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import ObjectMapper

struct Company: BaseModel {
    var id = 0
    var logoPath = ""
    var name = ""
    var originCountry = ""
    
    init?(map: Map) {
        mapping(map: map)
    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        logoPath <- map["logo_path"]
        name <- map["name"]
        originCountry <- map["origin_country"]

    }
}

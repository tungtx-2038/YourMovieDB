//
//  SearchResponse.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import ObjectMapper

final class SearchResponse: Mappable {
    var movies = [Movie]()
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        movies <- map["results"]
    }
}

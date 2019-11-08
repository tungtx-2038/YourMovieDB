//
//  SearchRequest.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class SearchRequest: BaseRequest {
    required init(url: String, search: String, page: Int) {
        let body: [String: Any] = ["page": page,
                                   "query": search]
        super.init(url: url, requestType: .get, body: body)
    }
}

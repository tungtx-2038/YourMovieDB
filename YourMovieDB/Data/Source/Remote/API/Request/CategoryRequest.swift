//
//  CategoryRequest.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class CategoryRequest: BaseRequest {
    required init(url: String, page: Int, genres: [Int]) {
        let body: [String: Any] = ["page": page,
                                   "with_genres": genres]
        super.init(url: url, requestType: .get, body: body)
    }
}

//
//  MovieRequest.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class MovieRequest: BaseRequest {
    required init(url: String, movieId: Int) {
        let body: [String: Any] = ["movie_id": movieId]
        super.init(url: url, requestType: .get, body: body)
    }
}

//
//  GenresRequest.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/8/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

final class GenresRequest: BaseRequest {
    required init(urlPath: String) {
        super.init(url: urlPath)
    }
}

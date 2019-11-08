//
//  BaseRequest.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/5/19.
//  Copyright © 2019 Sun. All rights reserved.
//api_key

import Foundation
import Alamofire

class BaseRequest {
    var url = ""
    var requestType = Alamofire.HTTPMethod.get
    var body: [String: Any]?
    var encoding: ParameterEncoding {
        switch requestType {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }

    init(url: String) {
        self.url = url
        self.body?["api_key"] = Keys.keyMovie
    }

    init(url: String, requestType: Alamofire.HTTPMethod) {
        self.url = url
        self.requestType = requestType
        self.body?["api_key"] = Keys.keyMovie
    }

    init(url: String, requestType: Alamofire.HTTPMethod, body: [String: Any]?) {
        self.url = url
        self.requestType = requestType
        self.body = body
        self.body?["api_key"] = Keys.keyMovie
    }
}

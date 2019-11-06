//
//  CustomRequestAdapter.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/5/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import Alamofire

final class CustomRequestAdapter: RequestAdapter {
    private let userDefault = UserDefaults()
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        if let accessToken = userDefault.string(forKey: Constants.keyMovie) {
            urlRequest.setValue(accessToken, forHTTPHeaderField: "X-AccessToken")
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
}

//
//  BaseUploadRequest.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/5/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseUploadRequest: NSObject {
    
    var url = ""
    var parameters: [String: Any]?
    var files: [File]?
    
    init(url: String) {
        self.url = url
    }
    
    init(url: String, files: [File]) {
        self.url = url
        self.files = files
    }
}

struct File {
    var key: String
    var path: String
}

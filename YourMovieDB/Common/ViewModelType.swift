//
//  ViewModelType.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/5/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

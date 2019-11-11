//
//  AppViewModel.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import RxCocoa
import RxSwift

struct AppViewModel: ViewModelType {
    let navigator: AppNavigatorType
    
    struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {
        let toMain: Driver<Void>
    }

    func transform(input: AppViewModel.Input) -> AppViewModel.Output {
        let toMain = input.loadTrigger
            .do(onNext: navigator.toMain)
        return Output(
            toMain: toMain
        )
    }
}

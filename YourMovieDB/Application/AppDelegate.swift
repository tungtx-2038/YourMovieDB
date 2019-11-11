//
//  AppDelegate.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/5/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import netfox
import RxSwift
import RxCocoa

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureNetfox()
        bindViewModel()
        return true
    }

    private func bindViewModel() {
        guard let window = window else {
            return
        }
        let viewModel = AppViewModel(navigator: AppNavigator(window: window))
        let input = AppViewModel.Input(loadTrigger: Driver.just(()))
        let output = viewModel.transform(input: input)
        output.toMain
            .drive()
            .disposed(by: DisposeBag())
    }
    private func configureNetfox() {
        NFX.sharedInstance().start()
    }
}

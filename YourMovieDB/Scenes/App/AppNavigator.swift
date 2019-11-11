//
//  BaseNavigator.swift
//  YourMovieDB
//
//  Created by Tung Tran on 11/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

protocol AppNavigatorType {
    func toMain()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow

    func toMain() {
        let homeVc = HomeViewController()
        let navigation = UINavigationController(rootViewController: homeVc)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}

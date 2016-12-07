//
//  AppDelegate.swift
//  CustomRefreshControlDemo
//
//  Created by 也许、 on 2016/12/6.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

let screenW = UIScreen.main.bounds.width
let screenH = UIScreen.main.bounds.height
let statusBarH:CGFloat = 20

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = IndexVC()
        self.window!.makeKeyAndVisible()
        
        return true
    }


}


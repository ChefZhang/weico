//
//  AppDelegate.swift
//  weico
//
//  Created by JohnZhang on 16/4/2.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // 设置全局颜色
//        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        // 创建window
        window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = CZMainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

    

}


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
        
        // 设置全局颜色
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        
        return true
    }
    
    
}

func CZLog<T>(messsage : T, file : String = __FILE__, funcName : String = __FUNCTION__, lineNum : Int = __LINE__) {
    
    
    #if DEBUG
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") //24H
        dateFormatter.dateFormat = "y-MM-dd HH:mm:ss.SSS"
        
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(dateFormatter.stringFromDate(NSDate())) [Swift flag | -D DEBUG] [\(fileName): \(lineNum)] :  \(messsage)")
        
    #endif
}
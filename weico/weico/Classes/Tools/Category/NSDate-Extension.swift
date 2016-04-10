//
//  UIButton+Extension.swift
//  weico
//
//  Created by JohnZhang on 16/4/8.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import Foundation

extension NSDate {
    class func createDateString(createAtStr : String) -> String {
        // 1.创建时间格式化对象
        let fmt = NSDateFormatter()
        fmt.dateFormat = "EEE MM dd HH:mm:ss Z yyyy"
        fmt.locale = NSLocale(localeIdentifier: "en")
        
        // 2.将字符串时间,转成NSDate类型
        guard let createDate = fmt.dateFromString(createAtStr) else {
            return ""
        }
        
        // 3.创建当前时间
        let nowDate = NSDate()
        
        // 4.计算创建时间和当前时间的时间差
        let interval = Int(nowDate.timeIntervalSinceDate(createDate))
        
        // 5.对时间间隔处理
        // 5.1.显示刚刚
        if interval < 60 {
            return "刚刚"
        }
        
        // 5.2.59分钟前
        if interval < 60 * 60 {
            return "\(interval / 60)分钟前"
        }
        
        // 5.3.11小时前
        if interval < 60 * 60 * 24 {
            return "\(interval / (60 * 60))小时前"
        }
        
        // 5.4.创建日历对象
        let calendar = NSCalendar.currentCalendar()
        
        // 5.5.处理昨天数据: 昨天 12:23
        if calendar.isDateInYesterday(createDate) {
            fmt.dateFormat = "昨天 HH:mm"
            let timeStr = fmt.stringFromDate(createDate)
            return timeStr
        }
        
        // 5.6.处理一年之内: 02-22 12:22
        let cmps = calendar.components(.Year, fromDate: createDate, toDate: nowDate, options: [])
        if cmps.year < 1 {
            fmt.dateFormat = "MM-dd HH:mm"
            let timeStr = fmt.stringFromDate(createDate)
            return timeStr
        }
        
        // 5.7.超过一年: 2014-02-12 13:22
        fmt.dateFormat = "yyyy-MM-dd HH:mm"
        let timeStr = fmt.stringFromDate(createDate)
        return timeStr
    }
}
//
//  CZUserAccountItem.swift
//  weico
//
//  Created by JohnZhang on 16/4/7.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZUserAccountItem: NSObject, NSCoding {

    // MARK:- 属性
    /// 授权AccessToken
    var access_token : String?
    /// 过期时间-->秒
    var expires_in : NSTimeInterval = 0.0 {
        didSet {
            expires_date = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    /// 用户ID
    var uid : String?
    
    // 自己添加的属性,用于时间的转换
    var expires_date : NSDate?
    
    /// 昵称
    var screen_name : String?
    
    /// 用户的头像地址
    var avatar_large : String?
    
    
    // MARK:- 方法的重写
    override init() {
        
    }
    
    init(dict: [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    // 重写description属性,不然只能打印地址
    override var description: String {
        return dictionaryWithValuesForKeys(["access_token", "expires_date", "uid", "screen_name", "avatar_large"]).description
    }
    
    
    // NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeObject(uid, forKey: "uid")
        aCoder.encodeObject(expires_date, forKey: "expires_date")
        aCoder.encodeObject(screen_name, forKey: "screen_name")
        aCoder.encodeObject(avatar_large, forKey: "avatar_large")
    }
    
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        uid = aDecoder.decodeObjectForKey("uid") as? String
        expires_date = aDecoder.decodeObjectForKey("expires_date") as? NSDate
        screen_name = aDecoder.decodeObjectForKey("screen_name") as? String
        avatar_large = aDecoder.decodeObjectForKey("avatar_large") as? String
    }
    
}

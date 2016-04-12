//
//  CZStatus.swift
//  weico
//
//  Created by JohnZhang on 16/4/10.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZStatus: NSObject {
    // MARK:- 属性
    /// 微博创建时间
    var created_at : String?
    /// 微博来源
    var source : String?
    /// 微博的正文
    var text : String?
    /// 微博的ID
    var mid : Int = 0
    /// 用户模型
    var user: CZUser?
    /// 微博的配图
    var pic_urls : [[String : String]]?
    
    
    
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
        // 将用户字典转成用户模型对象
        if let userDict = dict["user"] as? [String : AnyObject] {
            user = CZUser(dict: userDict)
        }
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}

}



//
//  CZUser.swift
//  weico
//
//  Created by JohnZhang on 16/4/10.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZUser: NSObject {
    // MARK:- 属性
    /// 用户的头像
    var profile_image_url : String?
    /// 用户的昵称
    var screen_name : String?
    /// 用户的认证类型
    var verified_type : Int = -1     /// 用户的会员等级
    var mbrank : Int = 0     
    
    // MARK: - 数据处理
    var verifiedImage : UIImage?
    var vipImage : UIImage?
    
    // MARK:- 自定义构造函数
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}

}

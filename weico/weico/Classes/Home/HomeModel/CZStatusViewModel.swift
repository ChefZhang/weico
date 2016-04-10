//
//  CZStatusViewModel.swift
//  weico
//
//  Created by JohnZhang on 16/4/10.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZStatusViewModel: NSObject {

    var status: CZStatus?
    
    // MARK: - 对数据处理的属性
    /// 微博来源
    var sourceText : String?
    /// 创建时间
    var createAtText : String?
    /// 处理用户认证图标
    var verifiedImage : UIImage?
    /// 处理用户会员等级
    var vipImage : UIImage?
    
    init(status: CZStatus) {
        self.status = status
        
        // 处理微博来源
        if let source = status.source where source != "" {
            let startIndex = (source as NSString).rangeOfString(">").location + 1
            let length = (source as NSString).rangeOfString("</").location - startIndex
            
            sourceText = (source as NSString).substringWithRange(NSRange(location: startIndex, length: length))
        }
        
        // 创建时间处理
        if let createAt = status.created_at {
            createAtText = NSDate.createDateString(createAt)
        }
        
        // 处理认证
        let verifiedType = status.user?.verified_type ?? -1
        switch verifiedType {
        case 0:
            verifiedImage = UIImage(named: "avatar_vip")
        case 2, 3, 5:
            verifiedImage = UIImage(named: "avatar_enterprise_vip")
        case 220:
            verifiedImage = UIImage(named: "avatar_grassroot")
        default:
            verifiedImage = nil
        }
        
        // 处理会员图标
        let mbrank = status.user?.mbrank ?? 0
        if mbrank > 0 && mbrank <= 6 {
            vipImage = UIImage(named: "common_icon_membership_level\(mbrank)")
        }
    }
}

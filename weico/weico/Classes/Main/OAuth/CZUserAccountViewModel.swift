//
//  CZUserAccountViewModel.swift
//  weico
//
//  Created by JohnZhang on 16/4/8.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZUserAccountViewModel {
    
    // MAKR: - 单例
    static let shareInstance: CZUserAccountViewModel = CZUserAccountViewModel()
    
    // MARK: - 定义属性
    var account: CZUserAccountItem?
    
    // MAKR: - 计算属性
    
    var path: String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        return (path as NSString).stringByAppendingPathComponent("account.plist")
    }
    
    var isLogin: Bool {
        if account == nil {
            return false
        }
        
        guard let expiresDate = account?.expires_date else {
            return false
        }
        
        return expiresDate.compare(NSDate()) == NSComparisonResult.OrderedDescending
    }
    
    init() {
        // 读取账号信息
        account = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? CZUserAccountItem
    }
    
}

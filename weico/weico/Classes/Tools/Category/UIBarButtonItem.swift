//
//  UIBarButtonItem.swift
//  weico
//
//  Created by JohnZhang on 16/4/6.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    // 遍历构造函数通常用在对系统的类进行构造函数的扩充时使用
    convenience init(imageName: String) {
        self.init()
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: .Selected)
        btn.sizeToFit()

        self.customView = btn
    }
}

//
//  UIButton+Extension.swift
//  weico
//
//  Created by JohnZhang on 16/4/5.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

// MARK:- 创建分类
extension UIButton {

    // swift中类方法是以class开头的方法.类似于OC中+开头的方法
    class func createBtn(imageName: String, bgImageName: String) -> UIButton {
        
        let btn = UIButton()
        
        // 2.设置btn的属性
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        btn.setBackgroundImage(UIImage(named: bgImageName), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), forState: .Highlighted)
        btn.sizeToFit()
        
        return btn
    }
    
    // convenience : 便利,使用convenience修饰的构造函数叫做便利构造函数
    // 遍历构造函数通常用在对系统的类进行构造函数的扩充时使用
    /*
    遍历构造函数的特点
    1.遍历构造函数通常都是写在extension里面
    2.遍历构造函数init前面需要加载convenience
    3.在遍历构造函数中需要明确的调用self.init()
    */
    convenience init(imageName: String, bgImageName: String) {
        self.init()
        
        setImage(UIImage(named: imageName), forState: .Normal)
        setImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        setBackgroundImage(UIImage(named: bgImageName), forState: .Normal)
        setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), forState: .Highlighted)
        sizeToFit()
    }
    
}



//
//  CZVisitorView.swift
//  weico
//
//  Created by JohnZhang on 16/4/5.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZVisitorView: UIView {

    // MARK:- 提供快速通过xib创建的类方法
    class func visitorView() -> CZVisitorView {
        return NSBundle.mainBundle().loadNibNamed("CZVisitorView", owner: nil, options: nil).first as! CZVisitorView
    }

    // MARK:- 控件的属性
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    
    /// 声明属性
    @IBOutlet weak var registBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    
}

extension CZVisitorView {
    // MARK:- 自定义访客视图
    func setupVisitorView(iconName: String, title: String){
        rotationView.hidden = true
        iconView.image = UIImage(named: iconName)
        tipLabel.text = title
    }
}


extension CZVisitorView {
    // MARK:- 动画旋转
    func beginRotationAnim() {
        // 1.创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 2.设置动画的属性
        rotationAnim.fromValue = 0
        rotationAnim.toValue = M_PI * 2
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 8
        // 防止切换界面或退到后台,动画停止播放
        rotationAnim.removedOnCompletion = false
        
        // 3.将动画添加到layer中
        rotationView.layer.addAnimation(rotationAnim, forKey: nil)
    }

}
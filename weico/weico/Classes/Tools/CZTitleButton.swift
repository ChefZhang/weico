//
//  CZTitleButton.swift
//  weico
//
//  Created by JohnZhang on 16/4/6.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZTitleButton: UIButton {

    // MARK: - 重写init函数
    // 重写父类就是调用super,自定义构造就是self
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: .Normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: .Selected)
        setTitleColor(UIColor.blackColor(), forState: .Normal)
        sizeToFit()
    }

    
    // 就是要这么写哦,swift规定:重写控件的init(frame方法)或者init()方法,必须重写init?(coder aDecoder: NSCoder)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel!.frame.origin.x = 0
        imageView!.frame.origin.x = titleLabel!.frame.size.width + 5
    }

}

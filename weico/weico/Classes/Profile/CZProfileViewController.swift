//
//  CZProfileViewController.swift
//  weico
//
//  Created by JohnZhang on 16/4/2.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZProfileViewController: CZBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        visitorView.setupVisitorView("visitordiscover_image_profile", title: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
    }
}

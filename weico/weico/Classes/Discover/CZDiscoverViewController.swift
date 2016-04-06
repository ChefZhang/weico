//
//  CZDiscoverViewController.swift
//  weico
//
//  Created by JohnZhang on 16/4/2.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZDiscoverViewController: CZBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.setupVisitorView("visitordiscover_image_message", title: "登录后，别人评论你的微博，给你发消息，都会在这里收到通知")
    }
}

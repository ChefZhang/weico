//
//  CZMainViewController.swift
//  weico
//
//  Created by JohnZhang on 16/4/2.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZMainViewController: UITabBarController {

    // MARK:- 懒加载   懒加载一定要用var
    private lazy var publishBtn = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPublishBtn()
    }
}

extension CZMainViewController {
    @objc private func setupPublishBtn() {
        tabBar.addSubview(publishBtn)
        
        publishBtn.center = CGPointMake(tabBar.center.x, tabBar.bounds.size.height * 0.5)
        
        // Selector两种写法: 1>Selector("composeBtnClick") 2> "composeBtnClick"
        publishBtn.addTarget(self, action: "publishBtnClick", forControlEvents: .TouchUpInside)
    }
}

extension CZMainViewController {
    @objc private func publishBtnClick() {
//        print("asf");
    }
}
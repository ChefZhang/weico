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
//    private lazy var publishBtn = UIButton()
//    private lazy var publishBtn = UIButton.createBtn("tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    private lazy var publishBtn = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupPublishBtn()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in 0..<tabBar.items!.count {
            
            let item = tabBar.items![i]
            
            if i == 2 {
                item.enabled = false
            }
        }
        
    }
}

extension CZMainViewController {
    @objc private func setupPublishBtn() {
        tabBar.addSubview(publishBtn)
        
//        publishBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
//        publishBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
//        publishBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
//        publishBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        
        
        publishBtn.center = CGPointMake(tabBar.center.x, tabBar.bounds.size.height * 0.5)
    }
}
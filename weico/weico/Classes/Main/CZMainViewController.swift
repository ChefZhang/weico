//
//  CZMainViewController.swift
//  weico
//
//  Created by JohnZhang on 16/4/2.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 系统自带
//        addChildViewController(CZHomeViewController())
//        addChildViewController(CZMessageViewController())
//        addChildViewController(CZDiscoverViewController())
//        addChildViewController(CZProfileViewController())
        
        // 函数重载
        addChildViewController(CZHomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(CZMessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(CZDiscoverViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(CZProfileViewController(), title: "我", imageName: "tabbar_profile")
    }

    // private在当前文件中可以访问,但是其他文件不能访问

    private func addChildViewController(childController: UIViewController, title: String, imageName: String) {
        // 1.设置子控制器的属性
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        // 因为微博全是橘黄色,所以我为了偷懒,就用了AppDelegate里面的tabBarApperance设置了全局都是橘黄色
        // 想要自己设置,就用下面的
        

        /*
        var image = UIImage(named: imageName)
        image = image?.imageWithRenderingMode( .AlwaysOriginal)
        childController.tabBarItem.image = image
        var selectedImage = UIImage(named: imageName + "_highlighted")
        selectedImage = selectedImage?.imageWithRenderingMode( .AlwaysOriginal)
        childController.tabBarItem.selectedImage = selectedImage
        */


        // 2.包装导航控制器
        let childNav = UINavigationController(rootViewController: childController)
        
        // 3.添加导航控制器
        addChildViewController(childNav)
    }
}

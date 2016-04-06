//
//  CZHomeViewController.swift
//  weico
//
//  Created by JohnZhang on 16/4/2.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZHomeViewController: CZBaseViewController {

    
    // MARK:- 懒加载
    lazy private var titleBtn: CZTitleButton = CZTitleButton()
    lazy private var popoverAnimation: CZPopoverAnimation = CZPopoverAnimation()
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.beginRotationAnim()
        
        if !isLogin {
            return
        }
        
        setupNavigationBar()
        
    }

    
}

// MARK:- 设置UI界面,nagationItem
extension CZHomeViewController {
    private func setupNavigationBar() {

//        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
//        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        let leftBtn = UIButton(imageName: "navigationbar_friendattention")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        leftBtn.addTarget(self, action: "leftBarButtonItemClick", forControlEvents: .TouchUpInside)
        
        let rightBtn = UIButton(imageName: "navigationbar_pop")
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        rightBtn.addTarget(self, action: "rightBarButtonItemClick", forControlEvents: .TouchUpInside)
        
        titleBtn.setTitle("captianZhu", forState: .Normal)
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: .TouchUpInside)
        navigationItem.titleView = titleBtn
    }
}


// MARK: -监听事件
extension CZHomeViewController {
    @objc private func leftBarButtonItemClick() {
        print("leftBarButtonItem")
    }
    
    @objc private func rightBarButtonItemClick() {
        print("rightBarButtonItem")
    }
    
    @objc private func titleBtnClick(titleBtn : CZTitleButton) {
        titleBtn.selected = !titleBtn.selected
        
        let popoverVc = CZPopoverViewController()
        // 设置modal的样式,如果不设置的话,就会遮盖住首页中tableview的内容
        popoverVc.modalPresentationStyle = .Custom
        
        // 设置转场动画的代理
        popoverVc.transitioningDelegate = popoverAnimation
        
        presentViewController(popoverVc, animated: true, completion: nil)

    }
}








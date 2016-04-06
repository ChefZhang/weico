//
//  CZPresentationController.swift
//  weico
//
//  Created by JohnZhang on 16/4/6.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZPresentationController: UIPresentationController {

    // MARK: - 懒加载
    lazy private var coverView = UIView()
    
    // 重写container层的布局
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        presentedView()?.frame = CGRectMake(20, 55, 150, 250)
        presentedView()?.center.x = UIScreen.mainScreen().bounds.size.width * 0.5
        
        
        // 添加蒙板
        setupCoverView()
    }
}

extension CZPresentationController {
    private func setupCoverView() {
        
        coverView.frame = containerView!.bounds
        coverView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
        containerView?.insertSubview(coverView, atIndex: 0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "coverViewClick")
        containerView?.addGestureRecognizer(tapGesture)

        
    }
}

extension CZPresentationController {
    @objc private func coverViewClick() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
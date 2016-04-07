//
//  CZBaseViewController.swift
//  weico
//
//  Created by JohnZhang on 16/4/5.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit

class CZBaseViewController: UITableViewController {

    // MARK: - 未登录界面
    lazy var visitorView: CZVisitorView = CZVisitorView.visitorView()
    
    // MARK: - 默认为未登录状态
    var isLogin : Bool = false
    
    // MARK: - 系统回调函数,判断加载哪个界面
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupNavigationItems()

    }

}


// MARK:- 设置访客界面
extension CZBaseViewController {
    
    private func setupVisitorView() {
        view = visitorView
        
        // 拿到visitorView中的注册按钮和登录按钮,直接添加监听,这样的好处就是,不需要写代理方法或者闭包
        visitorView.registBtn.addTarget(self, action: "registerBtnClick", forControlEvents: .TouchUpInside)
        visitorView.loginBtn.addTarget(self, action: "loginBtnClick", forControlEvents: .TouchUpInside)
    }
    
    private func setupNavigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: "registerBtnClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: "loginBtnClick")
        
    }
}



// MARK:- 事件监听
extension CZBaseViewController {
    @objc private func registerBtnClick() {
        print("registerBtnClick")
    }
    
    @objc private func loginBtnClick() {
        let oauthVC = CZOAuthViewController()
        
        let oauthNav = UINavigationController(rootViewController: oauthVC)
        
        presentViewController(oauthNav, animated: true, completion: nil)
        
    }
}



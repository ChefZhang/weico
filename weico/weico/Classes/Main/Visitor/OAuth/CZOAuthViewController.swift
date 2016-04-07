//
//  CZOAuthViewController.swift
//  weico
//
//  Created by JohnZhang on 16/4/7.
//  Copyright © 2016年 JohnZhang. All rights reserved.
//

import UIKit
import SVProgressHUD

class CZOAuthViewController: UIViewController {

    // MARK: - 控件
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        webView.delegate = self
        
        setupNavigationItem()

        loadWebView()
        
    }

}

// MARK: - 设置UI
extension CZOAuthViewController {
    private func setupNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "closeItemClick")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: .Plain, target: self, action: "fillItemClick")
        
        title = "登录页面"
    }
    
    private func loadWebView() {
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(app_key)&redirect_uri=\(redirect_uri)"
        
        guard let url = NSURL(string: urlString) else {
            return
        }
        
        let requeset = NSURLRequest(URL: url)
        
        webView.loadRequest(requeset)
    }
}


// MARK: - 事件监听
extension CZOAuthViewController {
    /// 关闭
    @objc private func closeItemClick() {
        dismissViewControllerAnimated(true, completion: nil)
        
        SVProgressHUD.dismiss()
    }
    
    /// 填充
    @objc private func fillItemClick() {
        let jsCode = "document.getElementById('userId').value='zhangangzhu01@163.com';document.getElementById('passwd').value='haorenka';"
        
        // 执行js代码
        webView.stringByEvaluatingJavaScriptFromString(jsCode)
    }
}


// MARK: -webView的代理方法
extension CZOAuthViewController: UIWebViewDelegate {
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        SVProgressHUD.showErrorWithStatus("网络故障,请重试")
    }
    
    
    // 返回true加载页面,false不加载页面
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        // 获取URL,如果没有,就继续加载页面
        guard let url = request.URL else {
            return true
        }
        
        let urlString = url.absoluteString
        
        // 判断该字符串中是否包含code,没有就继续加载
        guard urlString.containsString("code=") else {
            return true
        }
        
        // 获得code截取出来,拿到对应的
        let code = urlString.componentsSeparatedByString("code=").last!
        
//        print(urlString)
//        print(code)
        
        loadAccessToken(code)
        
        return false
    }
}

extension CZOAuthViewController {
    private func loadAccessToken(code: String) {
        CZNetworkTools.shareInstance.loadAccessToken(code) { (result, error) -> () in
            
            // 错误校验
            if error != nil {
                print(error)
                return
            }

            guard let accountDict = result else {
                CZLog("没有获取授权后的数据")
                return
            }
            
            let account = CZUserAccountItem(dict: accountDict)
            
            self.loadUserInfo(account)

        }
    }
    
    private func loadUserInfo(account: CZUserAccountItem) {
        // 1.获取AccessToken
        guard let accessToken = account.access_token else {
            return
        }
        
        // 2.获取uid
        guard let uid = account.uid else {
            return
        }

        // 3.发送网络请求
        CZNetworkTools.shareInstance.loadUserInfo(accessToken, uid: uid) { (result, error) -> () in
            // 1.错误校验
            if error != nil {
                print(error)
                return
            }
            
            // 2.拿到用户信息的结果
            guard let userInfoDict = result else {
                return
            }
            
            // 3.从字典中取出昵称和用户头像地址
            account.screen_name = userInfoDict["screen_name"] as? String
            account.avatar_large = userInfoDict["avatar_large"] as? String
            
            print(account)
        }
    }
}

